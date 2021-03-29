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
    pystan \
    mdmail \
    hyperopt
RUN apt-get update && \
    apt-get install g++ -y && \
    rm -rf /var/lib/apt/lists/
RUN pip --no-cache-dir install fbprophet
CMD ['python', '--version']
