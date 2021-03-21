install.packages(c("httr", "jsonlite", "xml2"))

library(xml2)
library(httr)
library(jsonlite)
urlbase = 'https://stock-market-fgv.herokuapp.com/'
auth_dict = list(username = 'User Test R 2', password = 'teste')

### Registrando novo usuário
payload = auth_dict
payload['confirmation'] = 'teste'
result = POST(paste(urlbase, "register", sep = ""), body = payload )
output = content(result)
output

# get status
result = POST(paste(urlbase, "status", sep = ""), body = auth_dict )
output = content(result)
output


# cotação
payload = auth_dict
payload['symbol'] = 'IFGV11'
result = POST(paste(urlbase, "quotations", sep = ""), body = payload )
output = fromJSON(content(result, "text"))
output

# cotação histórica
payload = auth_dict
payload['symbol'] = 'IFGV11'
payload['date'] = '2020-12-22'
result = POST(paste(urlbase, "past_quotations", sep = ""), body = payload )
output = fromJSON(content(result, "text"), flatten = TRUE)
output


# compra
payload = auth_dict
payload['symbol'] = 'IFGV11'
payload['shares'] = 2
result = POST(paste(urlbase, "buy", sep = ""), body = payload )
output = content(result, "text")
output

# venda
payload = auth_dict
payload['symbol'] = 'IFGV11'
payload['shares'] = 2
result = POST(paste(urlbase, "sell", sep = ""), body = payload )
output = content(result, "text")
output
