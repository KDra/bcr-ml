FROM python:3.8-slim
SHELL ["/bin/bash", "-c"]
RUN apt-get update && \
    apt-get install build-essential unzip libaio1 zlib1g libsnappy-dev wget libpq-dev nano iputils-ping git rsync -y && \
    rm -rf /var/lib/apt/lists/
WORKDIR /opt/
RUN wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
RUN unzip instantclient-basic-linux.x64-21.1.0.0.0.zip && rm instantclient-basic-linux.x64-21.1.0.0.0.zip
# RUN wget -O polylearn-master.zip https://github.com/scikit-learn-contrib/polylearn/archive/master.zip && unzip polylearn-master.zip
# WORKDIR /tmp/polylearn-master
# RUN python setup.py build && python setup.py install
RUN apt-get remove unzip  wget -y
RUN rm -rf /tmp/* /var/cache/apt/archives /usr/share/doc/ /usr/share/man/ /usr/share/locale/ /usr/local/share/doc/ /usr/local/share/man/ /usr/local/share/locale/
ENV LD_LIBRARY_PATH=/opt/instantclient_21_1/:$LD_LIBRARY_PATH
RUN ldconfig
RUN pip --no-cache-dir install \
    openpyxl \
    lightgbm \
    lxml \
    xlrd \
    pandas \
    scikit-learn \
    scipy \
    psycopg2 \
    cx_Oracle==8.2.0 \
    sqlalchemy \
    plotly \
    xgboost \
    convertdate \
    holidays \
    lunarcalendar \
    pyarrow \
    hyperopt \
    streamlit
# RUN pip --no-cache-dir install cmdstanpy[all]
# RUN install_cmdstan -d /opt/
# RUN files=(/opt/cmdstan*); ln -s ${files[0]} /opt/cmdstanpy
# ENV CMDSTAN=/opt/cmdstanpy
# ENV STAN_BACKEND=CMDSTANPY
RUN pip --no-cache-dir install prophet
RUN pip --no-cache-dir install \
    dagit==0.11.9 \
    dagster==0.11.9 \
    dagster_postgres==0.11.9 \
    dagster_pandas==0.11.9
# RUN pip --no-cache-dir install \
#     imbalanced-learn \
#     deslib \
#     scikit-learn-extra \
#     sklearn-pandas \
#     Boruta==0.3 \
#     forestci \
#     category_encoders \
#     sklearn-contrib-lightning \
#     tensorflow-probability \
#     tensorboard \
#     tensorflow
RUN rm -rf /tmp/* /var/cache/apt/archives /usr/share/doc/ /usr/share/man/ /usr/share/locale/ /usr/local/share/doc/ /usr/local/share/man/ /usr/local/share/locale/
WORKDIR /root/.streamlit
COPY streamlit_config.toml config.toml
WORKDIR /root/
