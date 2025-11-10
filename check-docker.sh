#!/bin/bash

# Check if Docker is running and accessible

echo "Checking Docker status..."

if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed or not in PATH"
    echo "Please install Docker Desktop from: https://www.docker.com/products/docker-desktop"
    exit 1
fi

if docker info &> /dev/null; then
    echo "✅ Docker is running and accessible"
    exit 0
else
    echo "❌ Docker daemon is not accessible"
    echo ""
    echo "Possible solutions:"
    echo "1. Make sure Docker Desktop is running:"
    echo "   - Open Docker Desktop application"
    echo "   - Wait for it to fully start (whale icon in menu bar should be stable)"
    echo ""
    echo "2. On macOS, try:"
    echo "   open -a Docker"
    echo ""
    echo "3. Check Docker Desktop status:"
    echo "   - Look for Docker icon in your menu bar"
    echo "   - Click it to see if it says 'Docker Desktop is running'"
    echo ""
    echo "4. If Docker Desktop is running but you still get permission errors:"
    echo "   - Restart Docker Desktop"
    echo "   - Make sure you're using the same user account that installed Docker"
    exit 1
fi

