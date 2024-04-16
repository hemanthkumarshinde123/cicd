from fastapi import FastAPI


app = FastAPI()


@app.get('/')
def hello():
    return {"message": "WELCOME TO LEAP CODES!"}