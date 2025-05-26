FROM ros:noetic-perception-focal as base

ENV ROS_DISTRO=noetic

# Set work directory
WORKDIR /app

RUN apt update && apt install -y \
    python3 \
    python3-pip && \
    apt clean

# Copy Python dependencies
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Expose default port (adjust as needed)
EXPOSE 8888

# Launch the server (modify if your entrypoint differs)
CMD ["python3", "rosboard/rosboard.py"]