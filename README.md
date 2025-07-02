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
├── install_requirements/ # Các script cài đặt yêu cầu
├── auto_source.sh      # Script tự động source environment
└── install_ws.sh       # Script cài đặt workspace
```

## Thiết lập ban đầu

1. Cài đặt các yêu cầu hệ thống:
```bash
./install_requirements/install_requirements.sh
./install_requirements/install_package.sh
```

2. Khởi tạo workspace:
```bash
./install_ws.sh
```

3. Tải các git khác cần thiết cho project:
```bash
./{workspace}/src/git_clone.sh
```

## Tiện ích
- `install_ws.sh`: Tự động tạo nhanh một workspace
- `auto_source.sh`: Tự động source environment khi mở terminal
- Các script trong `install_requirements/` giúp cài đặt nhanh các gói cần thiết
- `git_clone.sh`: Script tự động clone các repository git được liệt kê trong file list_git_clone.txt (có trong cả ROS1 và ROS2 workspace)

## Ghi chú

- Để thêm package mới, tạo thư mục package trong `src/` tương ứng (ROS1/ROS2)
- Các workspace khác (ai_ws, simulation_ws, ui_ws) có thể được cấu hình tùy theo nhu cầu
