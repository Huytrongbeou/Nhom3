# For more information, please refer to https://aka.ms/vscode-docker-python (from chay tren moi truong nao, tu dong tai python thiet yeu ve/ slim la rut gon)
FROM python:3-slim

# Keeps Python from generating .pyc files in the container(Moi truong cua python)
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements(copy file requirement qua thu muc goc khi chay. Khi chay container thi no chay tren app)
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers(Them user vao de quan tri phan mem docker neu can bao mat)
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug(chay container)
CMD ["python", "myapp.py"]
