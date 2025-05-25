#!/bin/bash

# VirtuAI Office - Apple Silicon Optimized Deployment
# Specifically optimized for M1, M2, M3 MacBooks and iMacs

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
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
    echo -e "${CYAN}🍎 VirtuAI Office - Apple Silicon Optimized${NC}"
    echo -e "${CYAN}===========================================${NC}"
    echo -e "${YELLOW}Deploy a complete AI development team on your Mac!${NC}"
    echo ""
}

log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }
log_step() { echo -e "${PURPLE}🔄 $1${NC}"; }

# Detect Apple Silicon
detect_apple_silicon() {
    local arch=$(uname -m)
    local chip=$(sysctl -n machdep.cpu.brand_string 2>/dev/null || echo "Unknown")
    
    if [[ "$arch" == "arm64" ]]; then
        if [[ "$chip" == *"Apple M1"* ]]; then
            echo "m1"
        elif [[ "$chip" == *"Apple M2"* ]]; then
            echo "m2"
        elif [[ "$chip" == *"Apple M3"* ]]; then
            echo "m3"
        else
            echo "apple_silicon"
        fi
    else
        echo "intel"
    fi
}

# Check system requirements
check_system() {
    log_step "Checking Apple Silicon Mac requirements..."
    
    local chip_type=$(detect_apple_silicon)
    local memory_gb=$(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 ))
    local cpu_cores=$(sysctl -n hw.ncpu)
    
    case $chip_type in
        "m1")
            log_success "Detected Apple M1 chip - Excellent for AI workloads!"
            ;;
        "m2")
            log_success "Detected Apple M2 chip - Outstanding AI performance!"
            ;;
        "m3")
            log_success "Detected Apple M3 chip - Top-tier AI processing!"
            ;;
        "apple_silicon")
            log_success "Detected Apple Silicon - Great for local LLMs!"
            ;;
        "intel")
            log_warning "Intel Mac detected - Apple Silicon recommended for best performance"
            ;;
        *)
            log_error "Unable to detect chip type"
            ;;
    esac
    
    echo -e "${CYAN}System Specs:${NC}"
    echo -e "  💾 Memory: ${memory_gb}GB"
    echo -e "  🔥 CPU Cores: ${cpu_cores}"
    echo -e "  💻 Architecture: $(uname -m)"
    echo ""
    
    if [ $memory_gb -lt 8 ]; then
        log_warning "8GB+ RAM recommended for optimal AI performance"
        log_info "Your Mac will work but may be slower with large models"
    elif [ $memory_gb -ge 16 ]; then
        log_success "16GB+ RAM detected - Perfect for running multiple AI models!"
    else
        log_success "8GB+ RAM detected - Good for AI workloads"
    fi
    
    # Check available disk space
    local available_gb=$(df -g . | awk 'NR==2 {print $4}')
    if [ $available_gb -lt 10 ]; then
        log_error "At least 10GB free disk space required"
        exit 1
    else
        log_success "${available_gb}GB disk space available"
    fi
}

# Install Homebrew if needed
install_homebrew() {
    if command -v brew >/dev/null 2>&1; then
        log_success "Homebrew already installed"
        return
    fi
    
    log_step "Installing Homebrew (package manager for macOS)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    
    log_success "Homebrew installed successfully"
}

# Install dependencies via Homebrew
install_dependencies() {
    log_step "Installing dependencies via Homebrew..."
    
    # Update Homebrew
    brew update >/dev/null 2>&1
    
    # Install Python if needed
    if ! command -v python3 >/dev/null 2>&1; then
        log_info "Installing Python 3..."
        brew install python@3.11
    fi
    
    # Install Node.js if needed
    if ! command -v node >/dev/null 2>&1; then
        log_info "Installing Node.js..."
        brew install node
    fi
    
    # Install git if needed
    if ! command -v git >/dev/null 2>&1; then
        log_info "Installing Git..."
        brew install git
    fi
    
    # Verify installations
    PYTHON_CMD=$(which python3)
    NODE_VERSION=$(node --version)
    PYTHON_VERSION=$(python3 --version)
    
    log_success "Dependencies installed:"
    log_info "  Python: $PYTHON_VERSION"
    log_info "  Node.js: $NODE_VERSION"
    log_info "  Git: $(git --version)"
}

# Install Ollama optimized for Apple Silicon
install_ollama_apple_silicon() {
    log_step "Installing Ollama for Apple Silicon..."
    
    if command -v ollama >/dev/null 2>&1; then
        log_success "Ollama already installed ($(ollama --version 2>/dev/null || echo 'version unknown'))"
        return
    fi
    
    # Download and install Ollama for macOS
    log_info "Downloading Ollama for macOS..."
    curl -fsSL https://ollama.ai/install.sh | sh
    
    # Verify installation
    if command -v ollama >/dev/null 2>&1; then
        log_success "Ollama installed successfully"
    else
        log_error "Ollama installation failed"
        exit 1
    fi
}

# Start Ollama service
start_ollama() {
    log_step "Starting Ollama service..."
    
    # Check if already running
    if curl -s http://localhost:$OLLAMA_PORT/api/version >/dev/null 2>&1; then
        log_success "Ollama is already running"
        return
    fi
    
    # Start Ollama in background
    log_info "Starting Ollama server..."
    ollama serve >/dev/null 2>&1 &
    OLLAMA_PID=$!
    
    # Wait for startup with progress
    local max_attempts=30
    local attempt=0
    
    while [ $attempt -lt $max_attempts ]; do
        if curl -s http://localhost:$OLLAMA_PORT/api/version >/dev/null 2>&1; then
            log_success "Ollama service started successfully"
            return
        fi
        sleep 1
        ((attempt++))
        if [ $((attempt % 5)) -eq 0 ]; then
            log_info "Waiting for Ollama to start... ($attempt/$max_attempts)"
        fi
    done
    
    log_error "Failed to start Ollama service"
    exit 1
}

# Download optimized models for Apple Silicon
download_models() {
    log_step "Downloading AI models optimized for Apple Silicon..."
    
    local chip_type=$(detect_apple_silicon)
    local memory_gb=$(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 ))
    
    # Choose optimal model based on available memory
    if [ $memory_gb -ge 32 ]; then
        log_info "32GB+ RAM detected - downloading high-performance models"
        MODEL_SIZE="13b"
        MODELS=("llama2:13b" "codellama:13b")
    elif [ $memory_gb -ge 16 ]; then
        log_info "16GB+ RAM detected - downloading balanced performance models"
        MODEL_SIZE="7b"
        MODELS=("llama2:7b" "codellama:7b")
    else
        log_info "8-16GB RAM detected - downloading efficient models"
        MODEL_SIZE="7b"
        MODELS=("llama2:7b")
    fi
    
    for model in "${MODELS[@]}"; do
        if ollama list | grep -q "$model"; then
            log_success "Model $model already available"
        else
            log_info "Downloading $model (optimized for Apple Silicon)..."
            ollama pull "$model" || {
                log_warning "Failed to download $model, continuing with available models"
            }
        fi
    done
    
    # Verify at least one model is available
    if ! ollama list | grep -q "llama2:7b"; then
        log_warning "No models found, downloading basic model..."
        ollama pull llama2:7b
    fi
    
    log_success "AI models ready for Apple Silicon"
}

main() {
    print_header
    
    # Verify we're on macOS
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "This script is optimized for macOS. Use the standard deploy.sh for other platforms."
        exit 1
    fi
    
    check_system
    install_homebrew
    install_dependencies
    install_ollama_apple_silicon
    start_ollama
    download_models
    
    log_success "Apple Silicon optimization complete!"
    echo ""
    echo -e "${CYAN}🚀 Your Apple Silicon Mac is ready for AI development!${NC}"
    echo -e "${BLUE}Next: Download VirtuAI Office code and run the full deployment${NC}"
}

main "$@"
