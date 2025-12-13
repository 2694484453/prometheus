## kubernetes-state-metrics 对外暴露
kubernetes-state-metrics 对外暴露，使其可以被外部prometheus实例监控。
### 方案1:nodePort方式
设置对外ip，通过ip:port方式访问

### 方案2:内置代理方式
通过集群内部代理软件nginx、trafik、caddy等