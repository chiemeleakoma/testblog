FROM python:3.6-alpine
ADD . /testblog
WORKDIR /testblog
RUN apk --no-cache update && apk --no-cache upgrade \
	&& apk --no-cache add curl tree \
	&& apk add -U --no-cache gcc build-base linux-headers ca-certificates \
	python3-dev libffi-dev libressl-dev libxslt-dev \
	# Pillow Dependencies
	jpeg-dev zlib-dev lcms2-dev \
    	openjpeg-dev tiff-dev tk-dev \
	&& pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "manage.py", "run" ]
