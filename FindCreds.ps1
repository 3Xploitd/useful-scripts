


    param(
        [string]$string,
        [switch]$secret)
    if ($secret){
        $regex = @'
    {
    "Apr1 MD5": "\\$apr1\\$[a-zA-Z0-9_/\\.]{8}\\$[a-zA-Z0-9_/\\.]{22}",
    "Apache SHA": "\\{SHA\\}[0-9a-zA-Z/_=]{10,}",
    "Blowfish": "\\$2[abxyz]?\\$[0-9]{2}\\$[a-zA-Z0-9_/\\.]*",
    "Drupal": "\\$S\\$[a-zA-Z0-9_/\\.]{52}",
    "Joomlavbulletin": "[0-9a-zA-Z]{32}:[a-zA-Z0-9_]{16,32}",
    "Linux MD5": "\\$1\\$[a-zA-Z0-9_/\\.]{8}\\$[a-zA-Z0-9_/\\.]{22}",
    "phpbb3": "\\$H\\$[a-zA-Z0-9_/\\.]{31}",
    "sha512crypt": "\\$6\\$[a-zA-Z0-9_/\\.]{16}\\$[a-zA-Z0-9_/\\.]{86}",
    "Wordpress": "\\$P\\$[a-zA-Z0-9_/\\.]{31}",
    "md5": "(^|[^a-zA-Z0-9])[a-fA-F0-9]{32}([^a-zA-Z0-9]|$)",
    "sha1": "(^|[^a-zA-Z0-9])[a-fA-F0-9]{40}([^a-zA-Z0-9]|$)",
    "sha256": "(^|[^a-zA-Z0-9])[a-fA-F0-9]{64}([^a-zA-Z0-9]|$)",
    "sha512": "(^|[^a-zA-Z0-9])[a-fA-F0-9]{128}([^a-zA-Z0-9]|$)",
    "Artifactory API Token": "AKC[a-zA-Z0-9]{10,}",
    "Artifactory Password": "AP[0-9ABCDEF][a-zA-Z0-9]{8,}",
    "Authorization Basic": "basic [a-zA-Z0-9_:\\.=\\-]+",
    "Authorization Bearer": "bearer [a-zA-Z0-9_\\.=\\-]+",
    "Adafruit API Key": "([a-z0-9_-]{32})",
    "Adobe Client Id (Oauth Web)": "(adobe[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-f0-9]{32})['\"]\n",
    "Abode Client Secret": "(p8e-)[a-z0-9]{32}\n",
    "Age Secret Key": "AGE-SECRET-KEY-1[QPZRY9X8GF2TVDW0S3JN54KHCE6MUA7L]{58}\n",
    "Airtable API Key": "([a-z0-9]{17})\n",
    "Alchemi API Key": "(alchemi[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9-]{32})['\"]\n",
    "Alibaba Access Key ID": "(LTAI)[a-z0-9]{20}\n",
    "Alibaba Secret Key": "(alibaba[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{30})['\"]\n",
    "Artifactory API Key & Password": "[\"']AKC[a-zA-Z0-9]{10,}[\"']|[\"']AP[0-9ABCDEF][a-zA-Z0-9]{8,}[\"']\n",
    "Asana Client ID": "((asana[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([0-9]{16})['\"])|((asana[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"])\n",
    "Atlassian API Key": "(atlassian[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{24})['\"]\n",
    "AWS Client ID": "(A3T[A-Z0-9]|AKIA|AGPA|AIDA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{16}",
    "AWS MWS Key": "amzn\\.mws\\.[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",
    "AWS Secret Key": "aws(.{0,20})?['\"][0-9a-zA-Z\\/+]{40}['\"]",
    "AWS AppSync GraphQL Key": "da2-[a-z0-9]{26}",
    "Base32": "(?:[A-Z2-7]{8})*(?:[A-Z2-7]{2}={6}|[A-Z2-7]{4}={4}|[A-Z2-7]{5}={3}|[A-Z2-7]{7}=)?",
    "Base64": "(eyJ|YTo|Tzo|PD[89]|aHR0cHM6L|aHR0cDo|rO0)[a-zA-Z0-9+/]+={0,2}",
    "Basic Auth Credentials": "://[a-zA-Z0-9]+:[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z]+",
    "Beamer Client Secret": "(beamer[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"](b_[a-z0-9=_\\-]{44})['\"]\n",
    "Binance API Key": "(binance[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9]{64})['\"]\n",
    "Bitbucket Client Id": "((bitbucket[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"])\n",
    "Bitbucket Client Secret": "((bitbucket[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9_\\-]{64})['\"])\n",
    "BitcoinAverage API Key": "(bitcoin.?average[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9]{43})['\"]\n",
    "Bitquery API Key": "(bitquery[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Za-z0-9]{32})['\"]\n",
    "Bittrex Access Key and Access Key": "([a-z0-9]{32})\n",
    "Birise API Key": "(bitrise[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9_\\-]{86})['\"]\n",
    "Block API Key": "(block[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4})['\"]\n",
    "Blockchain API Key": "mainnet[a-zA-Z0-9]{32}|testnet[a-zA-Z0-9]{32}|ipfs[a-zA-Z0-9]{32}\n",
    "Blockfrost API Key": "(blockchain[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[0-9a-f]{12})['\"]\n",
    "Box API Key": "(box[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9]{32})['\"]\n",
    "Bravenewcoin API Key": "(bravenewcoin[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{50})['\"]\n",
    "Clearbit API Key": "sk_[a-z0-9]{32}\n",
    "Clojars API Key": "(CLOJARS_)[a-zA-Z0-9]{60}\n",
    "Cloudinary Basic Auth": "cloudinary://[0-9]{15}:[0-9A-Za-z]+@[a-z]+",
    "Coinbase Access Token": "([a-z0-9_-]{64})\n",
    "Coinlayer API Key": "(coinlayer[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"]\n",
    "Coinlib API Key": "(coinlib[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{16})['\"]\n",
    "Confluent Access Token & Secret Key": "([a-z0-9]{16})\n",
    "Contentful delivery API Key": "(contentful[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9=_\\-]{43})['\"]\n",
    "Covalent API Key": "ckey_[a-z0-9]{27}\n",
    "Charity Search API Key": "(charity.?search[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"]\n",
    "Databricks API Key": "dapi[a-h0-9]{32}\n",
    "DDownload API Key": "(ddownload[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{22})['\"]\n",
    "Defined Networking API token": "(dnkey-[a-z0-9=_\\-]{26}-[a-z0-9=_\\-]{52})\n",
    "Discord API Key, Client ID & Client Secret": "((discord[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-h0-9]{64}|[0-9]{18}|[a-z0-9=_\\-]{32})['\"])\n",
    "Droneci Access Token": "([a-z0-9]{32})\n",
    "Dropbox API Key": "sl.[a-zA-Z0-9_-]{136}\n",
    "Doppler API Key": "(dp\\.pt\\.)[a-zA-Z0-9]{43}\n",
    "Dropbox API secret/key, short & long lived API Key": "(dropbox[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{15}|sl\\.[a-z0-9=_\\-]{135}|[a-z0-9]{11}(AAAAAAAAAA)[a-z0-9_=\\-]{43})['\"]\n",
    "Duffel API Key": "duffel_(test|live)_[a-zA-Z0-9_-]{43}\n",
    "Dynatrace API Key": "dt0c01\\.[a-zA-Z0-9]{24}\\.[a-z0-9]{64}\n",
    "EasyPost API Key": "EZAK[a-zA-Z0-9]{54}\n",
    "EasyPost test API Key": "EZTK[a-zA-Z0-9]{54}\n",
    "Etherscan API Key": "(etherscan[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Z0-9]{34})['\"]\n",
    "Etsy Access Token": "([a-z0-9]{24})\n",
    "Facebook Access Token": "EAACEdEose0cBA[0-9A-Za-z]+",
    "Facebook Client ID": "([fF][aA][cC][eE][bB][oO][oO][kK]|[fF][bB])(.{0,20})?['\"][0-9]{13,17}",
    "Facebook Oauth": "[fF][aA][cC][eE][bB][oO][oO][kK].*['|\"][0-9a-f]{32}['|\"]\n",
    "Facebook Secret Key": "([fF][aA][cC][eE][bB][oO][oO][kK]|[fF][bB])(.{0,20})?['\"][0-9a-f]{32}\n",
    "Fastly API Key": "(fastly[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9=_\\-]{32})['\"]\n",
    "Finicity API Key & Client Secret": "(finicity[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-f0-9]{32}|[a-z0-9]{20})['\"]\n",
    "Flickr Access Token": "([a-z0-9]{32})\n",
    "Flutterweave Keys": "FLWPUBK_TEST-[a-hA-H0-9]{32}-X|FLWSECK_TEST-[a-hA-H0-9]{32}-X|FLWSECK_TEST[a-hA-H0-9]{12}\n",
    "Frame.io API Key": "fio-u-[a-zA-Z0-9_=\\-]{64}\n",
    "Freshbooks Access Token": "([a-z0-9]{64})\n",
    "Github": "github(.{0,20})?['\"][0-9a-zA-Z]{35,40}\n",
    "Github App Token": "(ghu|ghs)_[0-9a-zA-Z]{36}\n",
    "Github OAuth Access Token": "gho_[0-9a-zA-Z]{36}\n",
    "Github Personal Access Token": "ghp_[0-9a-zA-Z]{36}\n",
    "Github Refresh Token": "ghr_[0-9a-zA-Z]{76}\n",
    "GitHub Fine-Grained Personal Access Token": "github_pat_[0-9a-zA-Z_]{82}\n",
    "Gitlab Personal Access Token": "glpat-[0-9a-zA-Z\\-]{20}\n",
    "GitLab Pipeline Trigger Token": "glptt-[0-9a-f]{40}\n",
    "GitLab Runner Registration Token": "GR1348941[0-9a-zA-Z_\\-]{20}\n",
    "Gitter Access Token": "([a-z0-9_-]{40})\n",
    "GoCardless API Key": "live_[a-zA-Z0-9_=\\-]{40}\n",
    "GoFile API Key": "(gofile[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9]{32})['\"]\n",
    "Google API Key": "AIza[0-9A-Za-z_\\-]{35}",
    "Google Cloud Platform API Key": "(google|gcp|youtube|drive|yt)(.{0,20})?['\"][AIza[0-9a-z_\\-]{35}]['\"]\n",
    "Google Drive Oauth": "[0-9]+-[0-9A-Za-z_]{32}\\.apps\\.googleusercontent\\.com",
    "Google Oauth Access Token": "ya29\\.[0-9A-Za-z_\\-]+",
    "Google (GCP) Service-account": "\"type.+:.+\"service_account",
    "Grafana API Key": "eyJrIjoi[a-z0-9_=\\-]{72,92}\n",
    "Grafana cloud api token": "glc_[A-Za-z0-9\\+/]{32,}={0,2}\n",
    "Grafana service account token": "(glsa_[A-Za-z0-9]{32}_[A-Fa-f0-9]{8})\n",
    "Hashicorp Terraform user/org API Key": "[a-z0-9]{14}\\.atlasv1\\.[a-z0-9_=\\-]{60,70}\n",
    "Heroku API Key": "[hH][eE][rR][oO][kK][uU].{0,30}[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}",
    "Hubspot API Key": "['\"][a-h0-9]{8}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{12}['\"]\n",
    "Instatus API Key": "(instatus[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"]\n",
    "Intercom API Key & Client Secret/ID": "(intercom[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9=_]{60}|[a-h0-9]{8}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{12})['\"]\n",
    "Ionic API Key": "(ionic[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"](ion_[a-z0-9]{42})['\"]\n",
    "Jenkins Creds": "<[a-zA-Z]*>{[a-zA-Z0-9=+/]*}<\n",
    "JSON Web Token": "(ey[0-9a-z]{30,34}\\.ey[0-9a-z\\/_\\-]{30,}\\.[0-9a-zA-Z\\/_\\-]{10,}={0,2})\n",
    "Kraken Access Token": "([a-z0-9\\/=_\\+\\-]{80,90})\n",
    "Kucoin Access Token": "([a-f0-9]{24})\n",
    "Kucoin Secret Key": "([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\n",
    "Launchdarkly Access Token": "([a-z0-9=_\\-]{40})\n",
    "Linear API Key": "(lin_api_[a-zA-Z0-9]{40})\n",
    "Linear Client Secret/ID": "((linear[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-f0-9]{32})['\"])\n",
    "LinkedIn Client ID": "linkedin(.{0,20})?['\"][0-9a-z]{12}['\"]\n",
    "LinkedIn Secret Key": "linkedin(.{0,20})?['\"][0-9a-z]{16}['\"]\n",
    "Lob API Key": "((lob[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]((live|test)_[a-f0-9]{35})['\"])|((lob[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]((test|live)_pub_[a-f0-9]{31})['\"])\n",
    "Lob Publishable API Key": "((test|live)_pub_[a-f0-9]{31})\n",
    "MailboxValidator": "(mailbox.?validator[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Z0-9]{20})['\"]\n",
    "Mailchimp API Key": "[0-9a-f]{32}-us[0-9]{1,2}",
    "Mailgun API Key": "key-[0-9a-zA-Z]{32}'\n",
    "Mailgun Public Validation Key": "pubkey-[a-f0-9]{32}\n",
    "Mailgun Webhook signing key": "[a-h0-9]{32}-[a-h0-9]{8}-[a-h0-9]{8}\n",
    "Mapbox API Key": "(pk\\.[a-z0-9]{60}\\.[a-z0-9]{22})",
    "Mattermost Access Token": "([a-z0-9]{26})\n",
    "MessageBird API Key & API client ID": "(messagebird[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{25}|[a-h0-9]{8}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{4}-[a-h0-9]{12})['\"]\n",
    "Microsoft Teams Webhook": "https:\\/\\/[a-z0-9]+\\.webhook\\.office\\.com\\/webhookb2\\/[a-z0-9]{8}-([a-z0-9]{4}-){3}[a-z0-9]{12}@[a-z0-9]{8}-([a-z0-9]{4}-){3}[a-z0-9]{12}\\/IncomingWebhook\\/[a-z0-9]{32}\\/[a-z0-9]{8}-([a-z0-9]{4}-){3}[a-z0-9]{12}\n",
    "MojoAuth API Key": "[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\n",
    "Netlify Access Token": "([a-z0-9=_\\-]{40,46})\n",
    "New Relic User API Key, User API ID & Ingest Browser API Key": "(NRAK-[A-Z0-9]{27})|((newrelic[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Z0-9]{64})['\"])|(NRJS-[a-f0-9]{19})\n",
    "Nownodes": "(nownodes[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Za-z0-9]{32})['\"]\n",
    "Npm Access Token": "(npm_[a-zA-Z0-9]{36})\n",
    "Nytimes Access Token": "([a-z0-9=_\\-]{32})\n",
    "Okta Access Token": "([a-z0-9=_\\-]{42})\n",
    "OpenAI API Token": "sk-[A-Za-z0-9]{48}\n",
    "ORB Intelligence Access Key": "['\"][a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}['\"]\n",
    "Pastebin API Key": "(pastebin[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{32})['\"]\n",
    "PayPal Braintree Access Token": "access_token\\$production\\$[0-9a-z]{16}\\$[0-9a-f]{32}\n",
    "Picatic API Key": "sk_live_[0-9a-z]{32}",
    "Pinata API Key": "(pinata[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{64})['\"]\n",
    "Planetscale API Key": "pscale_tkn_[a-zA-Z0-9_\\.\\-]{43}\n",
    "PlanetScale OAuth token": "(pscale_oauth_[a-zA-Z0-9_\\.\\-]{32,64})\n",
    "Planetscale Password": "pscale_pw_[a-zA-Z0-9_\\.\\-]{43}\n",
    "Plaid API Token": "(access-(?:sandbox|development|production)-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\n",
    "Plaid Client ID": "([a-z0-9]{24})\n",
    "Plaid Secret key": "([a-z0-9]{30})\n",
    "Prefect API token": "(pnu_[a-z0-9]{36})\n",
    "Postman API Key": "PMAK-[a-fA-F0-9]{24}-[a-fA-F0-9]{34}\n",
    "Private Keys": "\\-\\-\\-\\-\\-BEGIN PRIVATE KEY\\-\\-\\-\\-\\-|\\-\\-\\-\\-\\-BEGIN RSA PRIVATE KEY\\-\\-\\-\\-\\-|\\-\\-\\-\\-\\-BEGIN OPENSSH PRIVATE KEY\\-\\-\\-\\-\\-|\\-\\-\\-\\-\\-BEGIN PGP PRIVATE KEY BLOCK\\-\\-\\-\\-\\-|\\-\\-\\-\\-\\-BEGIN DSA PRIVATE KEY\\-\\-\\-\\-\\-|\\-\\-\\-\\-\\-BEGIN EC PRIVATE KEY\\-\\-\\-\\-\\-\n",
    "Pulumi API Key": "pul-[a-f0-9]{40}\n",
    "PyPI upload token": "pypi-AgEIcHlwaS5vcmc[A-Za-z0-9_\\-]{50,}\n",
    "Quip API Key": "(quip[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-zA-Z0-9]{15}=\\|[0-9]{10}\\|[a-zA-Z0-9\\/+]{43}=)['\"]\n",
    "RapidAPI Access Token": "([a-z0-9_-]{50})\n",
    "Rubygem API Key": "rubygems_[a-f0-9]{48}\n",
    "Readme API token": "rdme_[a-z0-9]{70}\n",
    "Sendbird Access ID": "([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})\n",
    "Sendbird Access Token": "([a-f0-9]{40})\n",
    "Sendgrid API Key": "SG\\.[a-zA-Z0-9_\\.\\-]{66}\n",
    "Sendinblue API Key": "xkeysib-[a-f0-9]{64}-[a-zA-Z0-9]{16}\n",
    "Sentry Access Token": "([a-f0-9]{64})\n",
    "Shippo API Key, Access Token, Custom Access Token, Private App Access Token & Shared Secret": "shippo_(live|test)_[a-f0-9]{40}|shpat_[a-fA-F0-9]{32}|shpca_[a-fA-F0-9]{32}|shppa_[a-fA-F0-9]{32}|shpss_[a-fA-F0-9]{32}\n",
    "Sidekiq Secret": "([a-f0-9]{8}:[a-f0-9]{8})\n",
    "Sidekiq Sensitive URL": "([a-f0-9]{8}:[a-f0-9]{8})@(?:gems.contribsys.com|enterprise.contribsys.com)\n",
    "Slack Token": "xox[baprs]-([0-9a-zA-Z]{10,48})?",
    "Slack Webhook": "https://hooks.slack.com/services/T[a-zA-Z0-9_]{10}/B[a-zA-Z0-9_]{10}/[a-zA-Z0-9_]{24}",
    "Smarksheel API Key": "(smartsheet[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{26})['\"]\n",
    "Square Access Token": "sqOatp-[0-9A-Za-z_\\-]{22}",
    "Square API Key": "EAAAE[a-zA-Z0-9_-]{59}\n",
    "Square Oauth Secret": "sq0csp-[ 0-9A-Za-z_\\-]{43}",
    "Stytch API Key": "secret-.*-[a-zA-Z0-9_=\\-]{36}",
    "Stripe Access Token & API Key": "(sk|pk)_(test|live)_[0-9a-z]{10,32}|k_live_[0-9a-zA-Z]{24}\n",
    "SumoLogic Access ID": "([a-z0-9]{14})\n",
    "SumoLogic Access Token": "([a-z0-9]{64})\n",
    "Telegram Bot API Token": "[0-9]+:AA[0-9A-Za-z\\\\-_]{33}\n",
    "Travis CI Access Token": "([a-z0-9]{22})\n",
    "Trello API Key": "(trello[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([0-9a-z]{32})['\"]\n",
    "Twilio API Key": "SK[0-9a-fA-F]{32}",
    "Twitch API Key": "(twitch[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([a-z0-9]{30})['\"]\n",
    "Twitter Client ID": "[tT][wW][iI][tT][tT][eE][rR](.{0,20})?['\"][0-9a-z]{18,25}\n",
    "Twitter Bearer Token": "(A{22}[a-zA-Z0-9%]{80,100})\n",
    "Twitter Oauth": "[tT][wW][iI][tT][tT][eE][rR].{0,30}['\"\\\\s][0-9a-zA-Z]{35,44}['\"\\\\s]\n",
    "Twitter Secret Key": "[tT][wW][iI][tT][tT][eE][rR](.{0,20})?['\"][0-9a-z]{35,44}\n",
    "Typeform API Key": "tfp_[a-z0-9_\\.=\\-]{59}\n",
    "URLScan API Key": "['\"][a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}['\"]\n",
    "Vault Token": "[sb]\\.[a-zA-Z0-9]{24}",
    "Yandex Access Token": "(t1\\.[A-Z0-9a-z_-]+[=]{0,2}\\.[A-Z0-9a-z_-]{86}[=]{0,2})\n",
    "Yandex API Key": "(AQVN[A-Za-z0-9_\\-]{35,38})\n",
    "Yandex AWS Access Token": "(YC[a-zA-Z0-9_\\-]{38})\n",
    "Web3 API Key": "(web3[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([A-Za-z0-9_=\\-]+\\.[A-Za-z0-9_=\\-]+\\.?[A-Za-z0-9_.+/=\\-]*)['\"]\n",
    "Zendesk Secret Key": "([a-z0-9]{40})\n",
    "Generic API Key": "((key|api|token|secret|password)[a-z0-9_ \\.,\\-]{0,25})(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([0-9a-zA-Z_=\\-]{8,64})['\"]\n",
    "Generic Secret": "[sS][eE][cC][rR][eE][tT].*['\"][0-9a-zA-Z]{32,45}['\"]\n",
    "Basic Auth": "//(.+):(.+)@\n",
    "PHP Passwords": "(pwd|passwd|password|PASSWD|PASSWORD|dbuser|dbpass|pass').*[=:].+|define ?\\('(\\w*pass|\\w*pwd|\\w*user|\\w*datab)\n",
    "Config Secrets": "passwd.*|creden.*|^kind:[^a-zA-Z0-9_]?Secret|[^a-zA-Z0-9_]env:|secret:|secretName:|^kind:[^a-zA-Z0-9_]?EncryptionConfiguration|\\-\\-encryption\\-provider\\-config\n",
    "Simple Passwords": "passw.*[=:].+\n",
    "Generiac API tokens search": "(access_key|access_token|admin_pass|admin_user|algolia_admin_key|algolia_api_key|alias_pass|alicloud_access_key| amazon_secret_access_key|amazonaws|ansible_vault_password|aos_key|api_key|api_key_secret|api_key_sid|api_secret| api.googlemaps AIza|apidocs|apikey|apiSecret|app_debug|app_id|app_key|app_log_level|app_secret|appkey|appkeysecret| application_key|appsecret|appspot|auth_token|authorizationToken|authsecret|aws_access|aws_access_key_id|aws_bucket| aws_key|aws_secret|aws_secret_key|aws_token|AWSSecretKey|b2_app_key|bashrc password| bintray_apikey|bintray_gpg_password|bintray_key|bintraykey|bluemix_api_key|bluemix_pass|browserstack_access_key| bucket_password|bucketeer_aws_access_key_id|bucketeer_aws_secret_access_key|built_branch_deploy_key|bx_password|cache_driver| cache_s3_secret_key|cattle_access_key|cattle_secret_key|certificate_password|ci_deploy_password|client_secret| client_zpk_secret_key|clojars_password|cloud_api_key|cloud_watch_aws_access_key|cloudant_password| cloudflare_api_key|cloudflare_auth_key|cloudinary_api_secret|cloudinary_name|codecov_token|conn.login| connectionstring|consumer_key|consumer_secret|credentials|cypress_record_key|database_password|database_schema_test| datadog_api_key|datadog_app_key|db_password|db_server|db_username|dbpasswd|dbpassword|dbuser|deploy_password| digitalocean_ssh_key_body|digitalocean_ssh_key_ids|docker_hub_password|docker_key|docker_pass|docker_passwd| docker_password|dockerhub_password|dockerhubpassword|dot-files|dotfiles|droplet_travis_password|dynamoaccesskeyid| dynamosecretaccesskey|elastica_host|elastica_port|elasticsearch_password|encryption_key|encryption_password| env.heroku_api_key|env.sonatype_password|eureka.awssecretkey)[a-z0-9_ .,<\\-]{0,25}(=|>|:=|\\|\\|:|<=|=>|:).{0,5}['\"]([0-9a-zA-Z_=\\-]{8,64})['\"]\n",
    "Usernames": "username.*[=:].+\n",
    "Net user add": "net user .+ /add\n",
    "IPs": "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)",
    "Emails": "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    }
'@ | ConvertFrom-Json
    $regex_type = 'secrets'
    }
if ($string){
    $regex = "{'Search Pattern':'$string'}" | ConvertFrom-Json
    }

Get-ChildItem -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
   foreach ($obj in $regex.PSObject.Properties){
   $pattern_name = $obj.Name
   $pattern_value = $obj.Value
   $file_search = Select-String -pattern $pattern_value $_.FullName -Quiet -ErrorAction SilentlyContinue
   }

   if ($file_search -eq 'True') {
     Write-Host $pattern_name,'Found in',$_.FullName
      }

    }




