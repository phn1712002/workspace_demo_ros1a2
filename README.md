# ROS Workspace Demo

Workspace mẫu này được thiết kế để hỗ trợ phát triển ứng dụng robot trên cả ROS1 và ROS2.

## Cấu trúc thư mục

```
.
├── ai_ws/              # Workspace cho AI/ML
├── catkin_ws/          # Workspace ROS1 (Catkin)
│   └── src/            # Chứa các package ROS1
├── colcon_ws/          # Workspace ROS2 (Colcon)  
│   └── src/            # Chứa các package ROS2
├── simulation_ws/      # Workspace cho mô phỏng
├── ui_ws/              # Workspace cho giao diện người dùng
├── install/            # Các script cài đặt yêu cầu
├── auto_source.sh      # Script tự động source environment
└── install_ws.sh       # Script cài đặt workspace
```

## Thiết lập ban đầu
1. Tải demo 
```bash
git clone https://github.com/phn1712002/workspace_demo_ros1a2.git {name_project}
cd {name_project}
```

2. Khởi tạo workspace:
```bash
./install_ws.sh
```

3. Cài đặt các yêu cầu hệ thống:
```bash
./install/install_gits.sh       # Cài đặt các repository git cần thiết
./install/install_requiremensts.sh # Cài đặt các Python dependencies
./install/install_packages.sh   # Cài đặt các gói hệ thống
```

## Tiện ích

### Tiện ích workspace
- `install_ws.sh`: Tự động tạo workspace và cấu trúc thư mục cơ bản
- `auto_source.sh`: Tự động source environment ROS khi mở terminal

### Tiện ích cài đặt
- `install/install_gits.sh`: Clone các repository git được định nghĩa trong file cấu hình
- `install/install_packages.sh`: Cài đặt các gói hệ thống cần thiết cho ROS  
- `install/install_requiremensts.sh`: Cài đặt các Python dependencies từ requirements.txt trong các package

### Tiện tích git
- `git_clone.sh`: Script tự động clone các repository git (có trong cả ROS1 và ROS2 workspace)

## Ghi chú

- Để thêm package mới, tạo thư mục package trong `src/` tương ứng (ROS1/ROS2)
- Các workspace khác (ai_ws, simulation_ws, ui_ws) có thể được cấu hình tùy theo nhu cầu
