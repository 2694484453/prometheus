## 项目名称
> prometheus监控+exporter指标+grafana可视化系统部署脚本

## 运行条件
> 列出运行该项目所必须的条件和相关依赖  
* 条件一 git clone此项目
* 条件二 linux或docker+docker-compose环境下
* 条件三 赋予可执行文件必要权限

## 部署方案

### 方案1: 基于二进制客户端启动
>>1.拷贝安装包下的二进制文件到 /usr/local/bin 目录下或使用ln -s进行软连接后并赋予权限<br/>

### 方案2: 基于设置service启动
>>1.拷贝安装包下的二进制文件到 /usr/local/bin 目录下或使用ln -s进行软连接后并赋予权限<br/>
>>2.拷贝service文件到 /etc/systemd/system下<br/>
>>3.sudo systemctl daemon-reload
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
### 方案3：基于docker-compose部署启动
>>直接执行docker-compose -f xxx.yml up -d 


## 测试说明
> 如果有测试相关内容需要说明，请填写在这里  



## 技术架构
> git、docker、docker-compose、shell  


## 作者
> gaopuguang（2694484453@qq.com）

## 推荐
1.配置文件放入config和rules进行文件修改和提交，部署端使用git pull进行更新
