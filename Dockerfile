Klingt gut danke 
 
das ist natürlich zur zeit noch sehr viel wert- damit kann man gut arbeitspakete für front-end entwicklung übernehmen... bevor es alle können 
 
gerade beim bsh meeresumweltymposium: umweltbelasung durch moschus-verbindungen aus deos...
 
ungefähr  so abbaubar wie pfas...
 
gibt es da chemische abbauprozee?  Hat das wirkungen auf Hormonhaushlate von der Fauna?
 
anscheinend irritiert es kleinstlebewesen
 
habe auch ein poster gesehen dass plankton stark unter lärm leidet... schon ziemlich spannend mal wieder unerwartete ergebnisse zu sehen
 
Pein, Johannes
habe auch ein poster gesehen dass plankton stark unter lärm leidet... schon ziemlich spannend mal wieder unerwartete ergebnisse zu sehen
mh okay, das kling eher abwegig, vielleicht ist correlation mit ner dritten größe. Oder die frequenzen sind irgendwie Zellschädigend. Aber vielleicht ein intteresantes Them und was neues 
 
Moin, ich finde dieses "add your service" nicht auf edito datalab. Braucht man da einen speziellen account? 
 
Bei Douglas war das irgendwie auch nicht auffindbar Bar. Da war die Vermutung das es am Mercator gitlav Zugang lag aber den hast is ja
 
Vielleicht muss man das explizit durch den Support freischalten lassen. Erinner das nicht mehr. Werde mal den Chatbot auf Edito fragen. Vielleicht muss man entweder was in den Account Settings haben oder das durch Edito freischalten lassen
 
check mal in deb Ny account settings   ob du auch beta.test.mode entwickelt hast: 
 ansonsten kann es nur ein fnotwendiges resuchalten  sein
 
gib mir mal deinen EDITO user name und die email mit de rdu eingeligt bist
 
da?
 
Bin jetzt mit Family
 Habe Support geschrieben, schaue später rein
 
okay wollte auch nur deinen edito namen erfragen und hätte mich auch an den support gewendete mit allen betreffenden personen bei uns
 
aber dann sits da bei dir ja schon im gange
 
Haben mir gerade geschrieben dass ich nun Developer Access habe
 
ok support hat sich grad auch bei mir gemeldet ist wohl schicht beginn
 
# Prefer the docker/ folder for builds (Visual Port layout):

#

#   cd docker

#   build.bat

#

# This root Dockerfile remains as a short alias with the same image recipe.
 
FROM python:3.13-slim
 
ENV PYTHONUNBUFFERED=1 \

    PYTHONDONTWRITEBYTECODE=1 \

    PIP_NO_CACHE_DIR=1 \

    PIP_DISABLE_PIP_VERSION_CHECK=1
 
RUN apt-get update \
&& apt-get install -y --no-install-recommends curl libexpat1 \
&& rm -rf /var/lib/apt/lists/*
 
WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .
 
EXPOSE 8501
 
ENV STREAMLIT_SERVER_PORT=8501 \

    STREAMLIT_SERVER_ADDRESS=0.0.0.0 \

    STREAMLIT_SERVER_HEADLESS=true \

    STREAMLIT_BROWSER_GATHER_USAGE_STATS=false \

    APP_CONFIG=config/german_bight.yaml
 
HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \

    CMD curl --fail http://localhost:8501/_stcore/health || exit 1
 
ENTRYPOINT ["streamlit", "run", "app.py", \

            "--server.port=8501", "--server.address=0.0.0.0"]
 
