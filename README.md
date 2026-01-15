## 项目名称
> prometheus监控+exporter指标+grafana可视化系统部署脚本

## 运行条件
> 列出运行该项目所必须的条件和相关依赖  
* 条件一 git clone此项目
* 条件二 需要在linux或docker+docker-compose或k8s环境下

## 部署方案

### 简单方案1:适用于linux启动（基于二进制客户端启动）+ file服务发现
>1.拷贝安装包下的二进制文件到 /usr/local/bin 目录下或使用ln -s进行软连接后并赋予权限<br/>

### 简单方案2:适用于linux的开机自启动（基于设置service启动）+ file服务发现
>1.拷贝安装包下的二进制文件到 /usr/local/bin 目录下或使用ln -s进行软连接后并赋予权限<br/>
>2.拷贝service文件到 /etc/systemd/system下<br/>
>3.sudo systemctl daemon-reload
```aiignore
cp name.service /etc/systemd/system
```
> 重新加载 systemd 配置
```aiignore
sudo systemctl daemon-reload
```
> 启用开机自启
```aiignore
sudo systemctl enable name.service
```
> 启动服务
```aiignore
sudo systemctl start name.service
```
>检查服务状态
```aiignore
sudo systemctl status name.service
```
>查看详细日志
```aiignore
sudo journalctl -u name.service -f
```
### 中等方案3:适用于docker等容器化部署（基于docker-compose部署启动）+ file服务发现
> 直接执行docker-compose -f xxx.yml up -d 

### 高级方案4: prometheus + http-sd服务发现 + oss挂载(分布式文件系统实现规则文件管理)，可实现分布式告警系统（可多个pm实例）
> http-get接口暴露targets端点

> oss挂载rules.yml文件

### 高级方案5:适用于k8s等编排部署（helm&chart）原生动态服务发现
> prometheus基础包（包含prometheus、alertmanager、node-exporter等）
```text
#执行安装
helm install prometheus ./prometheus -n monitoring --create-namespace
#更新
helm upgrade prometheus ./prometheus -n monitoring
#卸载
helm uninstall prometheus -n monitoring
```

>kube-prometheus-stack安装包，一体化程度较高（包含prometheus、alertmanager、grafana、node-exporter等）
```text
#执行安装
helm install kube-prometheus-stack ./kube-prometheus-stack -n monitoring --create-namespace
#更新
helm upgrade kube-prometheus-stack ./kube-prometheus-stack -n monitoring
#卸载
helm uninstall kube-prometheus-stack ./kube-prometheus-stack -n monitoring
```
其他操作
```text
#创建namespace
kubectl create ns monitoring
#安装crd（如果提示缺少crd）
kubectl create -f prometheus-operator-crd
#删除namespace
kubectl delete ns monitoring
```

## 测试说明
> 如果有测试相关内容需要说明，请填写在这里  



## 技术架构
> git、docker、docker-compose、shell、helm&chart、分布式sw3


## 作者
> gaopuguang（2694484453@qq.com）

## 推荐（流水线自动化）
1.配置文件放入config和rules进行文件修改和提交，部署端使用git pull进行更新
