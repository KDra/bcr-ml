FROM python:3.8-slim
RUN apt-get update && \
    apt-get install g++ unzip libaio1 zlib1g libsnappy-dev wget -y && \
    rm -rf /var/lib/apt/lists/
RUN pip --no-cache-dir install \
    pandas \
    scikit-learn \
    scipy \
    dagster \
    dagster_postgres \
    dagster_pandas \
    dagit \
    sqlalchemy \
    cx_Oracle \
    great_expectations \
    numba \
    plotly \
    catboost \
    xgboost \
    convertdate \
    holidays \
    lunarcalendar \
    pystan==2.19.1.1 \
    dash \
    mdmail \
    gradio \
    pyarrow \
    hyperopt \
    streamlit \
    jupyterlab \
    jupyter-dash
RUN pip --no-cache-dir install prophet
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
# WORKDIR /tmp/
# RUN wget -O polylearn-master.zip https://github.com/scikit-learn-contrib/polylearn/archive/master.zip && unzip polylearn-master.zip
# WORKDIR /tmp/polylearn-master
# RUN python setup.py build && python setup.py install
WORKDIR /opt/
RUN wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
RUN unzip instantclient-basic-linux.x64-21.1.0.0.0.zip && rm instantclient-basic-linux.x64-21.1.0.0.0.zip
ENV LD_LIBRARY_PATH=/opt/instantclient_21_1/:$LD_LIBRARY_PATH
RUN ldconfig
RUN rm -rf /tmp/* /var/cache/apt/archives /usr/share/doc/ /usr/share/man/ /usr/share/locale/ /usr/local/share/doc/ /usr/local/share/man/
WORKDIR /root/.streamlit
COPY streamlit_config.toml config.toml
WORKDIR /root/
CMD ['python', '--version']
