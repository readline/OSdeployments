curl https://raw.githubusercontent.com/readline/OSdeployments/master/circleYum/circleYum.py > circleYum.py &&
/usr/bin/python circleYum.py gcc wget git tar which zlib zlib-devel openssl-devel mysql mysql-devel unzip libffi-devel &&
rm -f /etc/localtime &&
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&
cd /opt &&
wget -O /opt/Python-2.7.8.tgz https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz &&
tar zxvf Python-2.7.8.tgz &&
cd /opt/Python-2.7.8 &&
./configure --prefix=/opt/python &&
make &&
make install &&
cd /opt &&
rm -rf /opt/Python-2.7.8* &&
echo "export PATH=/opt/python/bin:$PATH" >> /.dockerinit &&
source /.dockerinit &&
wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py &&
python get-pip.py &&
rm get-pip.py &&
pip install MySQL-python &&
pip install jieba &&
wget -O tornado-4.1.tar.gz https://pypi.python.org/packages/source/t/tornado/tornado-4.1.tar.gz &&
tar zxvf tornado-4.1.tar.gz &&
cd tornado-4.1 &&
python setup.py build &&
python setup.py install &&
cd .. &&
rm -rf tornado-4.1* &&
pip install futures &&
pip install torndb &&
rm /circleYum.py /init.sh &&
echo All done!
