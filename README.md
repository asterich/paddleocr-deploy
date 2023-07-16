### 使用说明

本项目依赖CUDA 11.7

本项目的部署需要预先下载python依赖：
```bash
pip install -r requirements.txt
```

启动OCR+SER服务：
```bash
hub serving start -c hubserving/kie_ser/config.json
```
默认监听在 https://127.0.0.1:8871 下

SER的模型放到目录 model/ 下，网盘链接：
链接: https://pan.baidu.com/s/1DD_XZHVS0ulo2s_wakHllQ?pwd=2e8g 提取码: 2e8g 复制这段内容后打开百度网盘手机App，操作更方便哦 
--来自百度网盘超级会员v3的分享