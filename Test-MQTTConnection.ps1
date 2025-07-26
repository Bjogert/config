# ================================
# 🔧 MQTT CONNECTIVITY TEST SCRIPT
# ================================
# PowerShell script to test MQTT connection to Home Assistant

param(
    [Parameter(Mandatory=$true)]
    [string]$HomeAssistantIP,
    
    [Parameter(Mandatory=$false)]
    [int]$MQTTPort = 1883
)

Write-Host "🔧 Testing MQTT connectivity to Home Assistant" -ForegroundColor Cyan
Write-Host "Home Assistant IP: $HomeAssistantIP" -ForegroundColor Yellow
Write-Host "MQTT Port: $MQTTPort" -ForegroundColor Yellow
Write-Host ""

# Test 1: Ping Home Assistant
Write-Host "📡 Test 1: Pinging Home Assistant..." -ForegroundColor Green
try {
    $pingResult = Test-Connection -ComputerName $HomeAssistantIP -Count 4 -Quiet
    if ($pingResult) {
        Write-Host "✅ Ping successful - Home Assistant is reachable" -ForegroundColor Green
    } else {
        Write-Host "❌ Ping failed - Home Assistant is not reachable" -ForegroundColor Red
        Write-Host "Check network connection and IP address" -ForegroundColor Yellow
        return
    }
} catch {
    Write-Host "❌ Ping test failed: $($_.Exception.Message)" -ForegroundColor Red
    return
}

Write-Host ""

# Test 2: Test MQTT port connectivity
Write-Host "🔌 Test 2: Testing MQTT port connectivity..." -ForegroundColor Green
try {
    $portTest = Test-NetConnection -ComputerName $HomeAssistantIP -Port $MQTTPort -WarningAction SilentlyContinue
    if ($portTest.TcpTestSucceeded) {
        Write-Host "✅ MQTT port $MQTTPort is accessible" -ForegroundColor Green
    } else {
        Write-Host "❌ MQTT port $MQTTPort is not accessible" -ForegroundColor Red
        Write-Host "Possible issues:" -ForegroundColor Yellow
        Write-Host "  - MQTT broker is not running" -ForegroundColor Yellow
        Write-Host "  - Firewall is blocking the port" -ForegroundColor Yellow
        Write-Host "  - Wrong port number (try 8883 for SSL)" -ForegroundColor Yellow
        return
    }
} catch {
    Write-Host "❌ Port test failed: $($_.Exception.Message)" -ForegroundColor Red
    return
}

Write-Host ""

# Test 3: Check Home Assistant web interface
Write-Host "🌐 Test 3: Testing Home Assistant web interface..." -ForegroundColor Green
try {
    $webTest = Invoke-WebRequest -Uri "http://$HomeAssistantIP:8123" -TimeoutSec 10 -UseBasicParsing
    if ($webTest.StatusCode -eq 200) {
        Write-Host "✅ Home Assistant web interface is accessible" -ForegroundColor Green
    } else {
        Write-Host "⚠️ Home Assistant web interface returned status: $($webTest.StatusCode)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "⚠️ Could not reach Home Assistant web interface" -ForegroundColor Yellow
    Write-Host "This is normal if using HTTPS or different port" -ForegroundColor Gray
}

Write-Host ""

# Results summary
Write-Host "📋 CONNECTIVITY TEST SUMMARY" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Network connectivity: ✅ Working" -ForegroundColor Green
Write-Host "MQTT port access: ✅ Working" -ForegroundColor Green
Write-Host ""
Write-Host "🔧 NEXT STEPS FOR ESP32:" -ForegroundColor Yellow
Write-Host "1. Verify ESP32 WiFi credentials" -ForegroundColor White
Write-Host "2. Check ESP32 MQTT server IP: $HomeAssistantIP" -ForegroundColor White
Write-Host "3. Check ESP32 MQTT port: $MQTTPort" -ForegroundColor White
Write-Host "4. Verify MQTT username/password in ESP32 code" -ForegroundColor White
Write-Host "5. Check ESP32 serial monitor for MQTT connection messages" -ForegroundColor White
Write-Host ""
Write-Host "💡 To run this test, use:" -ForegroundColor Cyan
Write-Host "   .\Test-MQTTConnection.ps1 -HomeAssistantIP '192.168.1.XXX'" -ForegroundColor Gray
