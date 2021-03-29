FROM python:3.8-slim
RUN pip --no-cache-dir install \
    pandas \
    scikit-learn \
    scipy \
    dagster \
    dagster_postgres \
    dagster_pandas \
    dagit \
    sqlalchemy \
    cx-Oracle \
    great_expectations \
    numba \
    plotly \
    catboost \
    xgboost \
    convertdate \
    holidays \
    lunarcalendar \
    pystan==2.19.1.1 \
    mdmail \
    hyperopt
RUN apt-get update && \
    apt-get install g++ -y && \
    rm -rf /var/lib/apt/lists/
RUN pip --no-cache-dir install fbprophet
RUN pip --no-cache-dir install \
    dash==1.19.0 \
    tensorflow-probability \
    tensorboard \
    tensorflow
RUN pip --no-cache-dir install \
    gradio
CMD ['python', '--version']
