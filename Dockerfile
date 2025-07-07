FROM itzg/minecraft-server:latest
LABEL authors="Serweron"

RUN apt-get update && apt-get install -y curl xmlstarlet

ENV TYPE=PAPER \
    EULA="TRUE" \
    ONLINE_MODE="FALSE" \
    USE_AIKAR_FLAGS="TRUE" \
    PATCH_DEFINITIONS=/config-patches \
    SPIGET_RESOURCES=6245,1997 \
    ENABLE_COMMAND_BLOCK="TRUE" \
    MOTD="Serweron Minecraft development server!" \
    MEMORY=2G


RUN LATEST_VERSION=$(curl -s https://maven.pcreators.pl/releases/pl/serweron/SerweronLib/maven-metadata.xml | \
    xmlstarlet sel -t -v "/metadata/versioning/latest") && \
    curl -o /plugins/SerweronLib.jar "https://maven.pcreators.pl/releases/pl/serweron/SerweronLib/$LATEST_VERSION/SerweronLib-$LATEST_VERSION.jar"

COPY config-patches /config-patches
COPY --chmod=755 entrypoint* /

ENTRYPOINT ["sh","/entrypoint"]