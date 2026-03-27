# Use apenas um estágio para desenvolvimento facilitar a detecção de temas e provedores
FROM quay.io/keycloak/keycloak:26.0

# Habilita suporte ao Postgres
ENV KC_DB=postgres

WORKDIR /opt/keycloak

# Não rodaremos o 'build' aqui no Dockerfile para o modo start-dev, 
# deixando o Keycloak gerenciar a inicialização dinamicamente.
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--http-enabled=true", "--import-realm"]