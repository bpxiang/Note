/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64/jre/bin/java


export JAVA_HOME=/usr/lib/jvm/java
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

export PATH=$PATH:$JAVA_HOME/bin

这样我们就设置好了JDK，在输入source /etc/profile 就可以生效了.


ls -lrt /usr/bin/java
