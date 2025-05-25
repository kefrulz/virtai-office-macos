#!/bin/bash

# VirtuAI Office - Apple Silicon Optimized Management Script

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKEND_PORT=8000
FRONTEND_PORT=3000
OLLAMA_PORT=11434

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

detect_apple_silicon() {
    if [[ $(uname -m) == "arm64" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

print_status() {
    if [[ $(detect_apple_silicon) == "true" ]]; then
        echo -e "${CYAN}🍎 VirtuAI Office (Apple Silicon Optimized)${NC}"
        local chip=$(sysctl -n machdep.cpu.brand_string 2>/dev/null)
        echo -e "${GREEN}Running on: $chip${NC}"
    else
        echo -e "${BLUE}🤖 VirtuAI Office${NC}"
    fi
    echo -e "${BLUE}=====================================${NC}"
}

case "$1" in
    start)
        print_status
        echo ""
        echo -e "${BLUE}🚀 Starting VirtuAI Office...${NC}"
        
        # Start Ollama
        if ! curl -s http://localhost:$OLLAMA_PORT/api/version >/dev/null 2>&1; then
            echo "Starting Ollama..."
            ollama serve >/dev/null 2>&1 &
            sleep 3
        fi
        
        # Start backend
        echo "Starting Python backend..."
        cd "$PROJECT_DIR/backend"
        source venv/bin/activate 2>/dev/null || source venv/Scripts/activate
        python backend.py &
        
        # Start frontend
        echo "Starting React frontend..."
        cd "$PROJECT_DIR/frontend"
        PORT=$FRONTEND_PORT npm start >/dev/null 2>&1 &
        
        echo ""
        echo -e "${GREEN}✅ VirtuAI Office is starting!${NC}"
        echo -e "${BLUE}🌐 Dashboard: http://localhost:$FRONTEND_PORT${NC}"
        echo -e "${BLUE}🔧 Backend:   http://localhost:$BACKEND_PORT${NC}"
        if [[ $(detect_apple_silicon) == "true" ]]; then
            echo -e "${YELLOW}🍎 Optimized for Apple Silicon performance!${NC}"
        fi
        ;;
    stop)
        echo -e "${RED}🛑 Stopping VirtuAI Office...${NC}"
        pkill -f "python backend.py" 2>/dev/null
        pkill -f "npm start" 2>/dev/null
        pkill -f "node.*react-scripts" 2>/dev/null
        echo -e "${GREEN}✅ Stopped!${NC}"
        ;;
    status)
        print_status
        echo ""
        echo -e "${BLUE}📊 Service Status:${NC}"
        echo -n "Ollama:   "
        curl -s http://localhost:$OLLAMA_PORT/api/version >/dev/null && echo -e "${GREEN}🟢 Running${NC}" || echo -e "${RED}🔴 Stopped${NC}"
        echo -n "Backend:  "
        curl -s http://localhost:$BACKEND_PORT/api/status >/dev/null && echo -e "${GREEN}🟢 Running${NC}" || echo -e "${RED}🔴 Stopped${NC}"
        echo -n "Frontend: "
        curl -s http://localhost:$FRONTEND_PORT >/dev/null && echo -e "${GREEN}🟢 Running${NC}" || echo -e "${RED}🔴 Stopped${NC}"
        
        if [[ $(detect_apple_silicon) == "true" ]]; then
            echo ""
            echo -e "${CYAN}🍎 Apple Silicon Stats:${NC}"
            local memory_gb=$(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 ))
            echo "Memory: ${memory_gb}GB unified memory"
            echo "Models: $(ollama list | grep -c llama || echo 0) installed"
        fi
        ;;
    optimize)
        if [[ $(detect_apple_silicon) == "true" ]]; then
            echo -e "${CYAN}🍎 Apple Silicon Optimizations:${NC}"
            echo ""
            local memory_gb=$(( $(sysctl -n hw.memsize) / 1024 / 1024 / 1024 ))
            echo "Your Mac has ${memory_gb}GB unified memory"
            echo ""
            echo "Recommended models:"
            if [ $memory_gb -ge 32 ]; then
                echo "  • llama2:13b (high performance)"
                echo "  • codellama:13b (coding)"
            elif [ $memory_gb -ge 16 ]; then
                echo "  • llama2:7b (balanced)"
                echo "  • codellama:7b (coding)"
            else
                echo "  • llama2:7b (efficient)"
            fi
            echo ""
            echo "Current models:"
            ollama list
        else
            echo "Apple Silicon optimizations not available on this system"
        fi
        ;;
    *)
        print_status
        echo ""
        echo "Usage: $0 {start|stop|status|optimize}"
        echo ""
        echo "Commands:"
        echo "  start     - Start all services"
        echo "  stop      - Stop all services"
        echo "  status    - Check service status"
        if [[ $(detect_apple_silicon) == "true" ]]; then
            echo "  optimize  - Show Apple Silicon optimizations"
        fi
        ;;
esac
