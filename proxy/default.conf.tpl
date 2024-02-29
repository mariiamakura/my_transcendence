server {
	listen ${LISTEN_PORT};

	location /static {
		alias /vol/static;
	}

	#catch everything else if not catched by /static
	location / {
		uwsgi_pass				${APP_HOST}:${APP_PORT};
		include					/etc/nginx/uwsgi_params;
		client_max_body_size	10M;
	}
}