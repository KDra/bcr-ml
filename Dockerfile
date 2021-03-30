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
    dash==1.19.0 \
    mdmail \
    gradio \
    pyarrow \
    hyperopt
RUN pip --no-cache-dir install fbprophet
# RUN pip --no-cache-dir install \
#     tensorflow-probability \
#     tensorboard \
#     tensorflow
WORKDIR /opt/
RUN wget https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basic-linux.x64-21.1.0.0.0.zip
RUN unzip instantclient-basic-linux.x64-21.1.0.0.0.zip
ENV LD_LIBRARY_PATH=/opt/instantclient_21_1/:$LD_LIBRARY_PATH
WORKDIR /
CMD ['python', '--version']
