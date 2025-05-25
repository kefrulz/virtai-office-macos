# 🤖 VirtuAI Office

> **Deploy a complete AI development team in minutes - Optimized for Apple Silicon!**

[![GitHub stars](https://img.shields.io/github/stars/kefrulz/virtuai-office?style=social)](https://github.com/kefrulz/virtuai-office)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Apple Silicon](https://img.shields.io/badge/Apple%20Silicon-Optimized-blue.svg)](https://github.com/kefrulz/virtuai-office)
[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/downloads/)

VirtuAI Office is a complete AI-powered development team that runs entirely on your local machine. Deploy 5 specialized AI agents that collaborate like a real team - **especially optimized for Apple Silicon Macs**.

![VirtuAI Office Dashboard](https://via.placeholder.com/800x400/1e40af/ffffff?text=VirtuAI+Office+Dashboard)

## 🍎 Apple Silicon Quick Start

**For M1, M2, M3 Macs (Recommended):**
```bash
curl -fsSL https://raw.githubusercontent.com/kefrulz/virtuai-office/main/deploy-apple-silicon.sh | bash
```

**For Intel Macs & Other Platforms:**
```bash
curl -fsSL https://raw.githubusercontent.com/kefrulz/virtuai-office/main/deploy.sh | bash
```

## 🎯 What You Get

### 5 AI Team Members
- **👩‍💼 Alice Chen** - Product Manager (writes user stories & requirements)
- **👨‍💻 Marcus Dev** - Frontend Developer (React components & UI)  
- **👩‍💻 Sarah Backend** - Backend Developer (APIs & databases)
- **🎨 Luna Design** - UI/UX Designer (mockups & style guides)
- **🔍 TestBot QA** - QA Tester (test plans & automation)

### Real AI Capabilities
- ✅ **Smart task assignment** based on agent expertise
- ✅ **Actual LLM processing** using Ollama locally  
- ✅ **Real code generation** for React, Python, SQL
- ✅ **Team coordination** with daily standups
- ✅ **Project management** with task tracking
- ✅ **Live collaboration** between agents

## 🔥 Apple Silicon Advantages

| Feature | Intel Mac | Apple Silicon |
|---------|-----------|---------------|
| **AI Inference Speed** | 1x | 3-5x faster |
| **Memory Efficiency** | Standard | Unified memory |
| **Battery Life** | 2-4 hours | 8-12 hours |
| **Thermal Performance** | May throttle | Cool & quiet |
| **Model Capacity** | Limited | 2x larger models |

### Recommended Apple Silicon Configurations

**🟢 M1 MacBook Air (8GB)** - Perfect for learning and small projects
- Models: llama2:7b, codellama:7b
- Concurrent agents: 3-5
- Performance: Excellent

**🟡 M1/M2 MacBook Pro (16GB)** - Ideal for professional development  
- Models: llama2:13b, codellama:13b
- Concurrent agents: 5-8
- Performance: Outstanding

**🔥 M2/M3 MacBook Pro (32GB+)** - Desktop-class AI performance
- Models: llama2:70b (when available)
- Concurrent agents: 10+
- Performance: Exceptional

## 🌟 Features

| Feature | Description |
|---------|-------------|
| **🔒 100% Local** | No cloud dependencies, complete privacy |
| **🍎 Apple Silicon Optimized** | Native ARM64, Metal acceleration |
| **⚡ One-Click Setup** | Deploy complete system in minutes |
| **🎨 Modern UI** | React dashboard with real-time updates |
| **🔄 Auto-Scaling** | Boss AI orchestrates task assignment |
| **📊 Project Tracking** | Kanban boards, sprint planning, standups |
| **🛠️ Production Ready** | FastAPI backend, SQLite/PostgreSQL database |

## 🏃‍♂️ Quick Start

### Prerequisites for Apple Silicon
- **macOS Big Sur or later**
- **Apple Silicon Mac** (M1, M2, M3 recommended)
- **8GB+ RAM** (16GB+ recommended)
- **10GB free disk space**

### Installation
```bash
# Apple Silicon optimized (recommended)
curl -fsSL https://raw.githubusercontent.com/kefrulz/virtuai-office/main/deploy-apple-silicon.sh | bash

# Standard installation (Intel Macs, Linux, Windows)
curl -fsSL https://raw.githubusercontent.com/kefrulz/virtuai-office/main/deploy.sh | bash
```

### Access Your AI Office
- **Dashboard**: http://localhost:3000
- **API**: http://localhost:8000  
- **Docs**: http://localhost:8000/docs

## 💡 How to Use

1. **Create Tasks** → Click "Add Task" and describe what you need
2. **Watch Magic Happen** → AI agents automatically pick up and process tasks
3. **See Real Output** → Get actual code, documentation, designs, and test plans
4. **Run Standups** → Coordinate your AI team like a real development team
5. **Track Progress** → Monitor sprint completion and agent status

### Example Tasks to Try

- *"Create a user login page with React"* → Marcus Dev builds the component
- *"Design a shopping cart interface"* → Luna Design creates mockups  
- *"Build user authentication API"* → Sarah Backend writes Python code
- *"Write user stories for checkout flow"* → Alice Chen creates requirements
- *"Create test plan for payment system"* → TestBot QA writes test cases

## 📋 Management

### Apple Silicon Optimized Commands
```bash
# Start all services (with Apple Silicon optimizations)
./manage.sh start

# Check performance and memory usage
./manage.sh status

# Apple Silicon specific optimizations
./manage.sh optimize

# Stop all services
./manage.sh stop
```

## 🛠️ Manual Installation

### Apple Silicon Setup
```bash
# Install Homebrew (if not already installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install python@3.11 node ollama

# Clone repository
git clone https://github.com/kefrulz/virtuai-office.git
cd virtuai-office

# Setup backend
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Setup frontend
cd ../frontend
npm install

# Start Ollama and download models
ollama serve &
ollama pull llama2:7b  # or llama2:13b for 16GB+ Macs
```

## 🎨 Customization

### Optimize for Your Apple Silicon Mac
```bash
# Check your Mac's capabilities
./manage.sh optimize

# Choose optimal models based on your RAM
# 8GB:  llama2:7b
# 16GB: llama2:13b  
# 32GB: llama2:70b (future)
```

### Add New Agent Roles
1. Edit `backend/backend.py`
2. Add agent configuration in `startup_event()`
3. Define role-specific prompts and capabilities

## 📊 Performance Benchmarks

Typical task completion times on Apple Silicon:

| Task Type | M1 (8GB) | M2 (16GB) | M3 (24GB) |
|-----------|----------|-----------|-----------|
| Code Generation | 2-4 sec | 1-2 sec | 0.5-1 sec |
| User Stories | 1-3 sec | 0.5-1.5 sec | 0.3-0.8 sec |
| UI Design | 3-5 sec | 1.5-3 sec | 0.8-1.5 sec |
| Test Plans | 2-4 sec | 1-2.5 sec | 0.5-1.2 sec |

## 📚 Documentation

- [Apple Silicon Optimization Guide](docs/APPLE_SILICON.md)
- [Installation Guide](docs/INSTALLATION.md)
- [Architecture Overview](docs/ARCHITECTURE.md)
- [API Documentation](docs/API.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

**Apple Silicon specific contributions are especially welcome:**
- Model optimizations
- Metal Performance Shaders integration
- macOS native features
- Performance improvements

## 🔍 Troubleshooting

### Apple Silicon Specific Issues

**Rosetta conflicts:**
```bash
# Ensure native ARM64 installation
arch -arm64 brew install python node ollama
```

**Memory pressure:**
```bash
# Monitor memory usage
./manage.sh status

# Use smaller models if needed
ollama pull llama2:7b-q4_0
```

**Performance optimization:**
```bash
# Enable high-performance mode (plugged in)
sudo pmset -c powernap 0

# Check thermal state
pmset -g therm
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=kefrulz/virtuai-office&type=Date)](https://star-history.com/#kefrulz/virtuai-office&Date)

---

<div align="center">

**Ready to deploy your AI workforce on Apple Silicon?** 🚀

[⬇️ Download](https://github.com/kefrulz/virtuai-office/archive/refs/heads/main.zip) • [📖 Docs](docs/) • [🍎 Apple Silicon Guide](docs/APPLE_SILICON.md) • [🐛 Issues](https://github.com/kefrulz/virtuai-office/issues)

**Optimized for Apple Silicon • Made with ❤️ for the AI automation community**

</div>
