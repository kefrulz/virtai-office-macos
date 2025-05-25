#!/bin/bash

# VirtuAI Office - Standard Deployment Script
# Compatible with Linux, Windows WSL, and Intel Macs

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Configuration
PROJECT_NAME="virtuai-office"
GITHUB_REPO="kefrulz/virtuai-office"
BACKEND_PORT=8000
FRONTEND_PORT=3000
OLLAMA_PORT=11434

print_header() {
    echo -e "${PURPLE}"
    echo "██╗   ██╗██╗██████╗ ████████╗██╗   ██╗ █████╗ ██╗"
    echo "██║   ██║██║██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██║"
    echo "██║   ██║██║██████╔╝   ██║   ██║   ██║███████║██║"
    echo "╚██╗ ██╔╝██║██╔══██╗   ██║   ██║   ██║██╔══██║██║"
    echo " ╚████╔╝ ██║██║  ██║   ██║   ╚██████╔╝██║  ██║██║"
    echo "  ╚═══╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝"
    echo -e "${NC}"
    echo -e "${BLUE}🤖 VirtuAI Office - Standard Deployment${NC}"
    echo -e "${YELLOW}Deploy a complete AI development team in minutes!${NC}"
    echo ""
}

main() {
    print_header
    echo "Standard deployment script - use deploy-apple-silicon.sh for Apple Silicon optimization"
}

main "$@"
