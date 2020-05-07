FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
workdir /Housing_Prices_Prediction_App

## Step 2:
# Copy source code to working directory
copy . /Housing_Prices_Prediction_App
copy model_data /Housing_Prices_Prediction_App/model_data
## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
run pip freeze >> requirements.txt

run pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
expose 80 
## Step 5:
# Run app.py at container launch
cmd ["python","app.py"]
