function Delete-Index() {
    Invoke-Restmethod -Method Delete -Uri 'http://52.32.249.170:9200/kendex'
    $b = '{
        "mappings" : {
            "Weight" : {
                "properties" : {
                    "Weight" : {"type" : "float" }
                }
            },
            "Water" : {
                "properties" : {
                    "Water" : {"type" : "float" }
                }
            }
        }
    }'
    #$b = @{"properties" = @{"mappings" = @{'weight' = @{'type' = 'string';'index'='not_analyzed';'store'='yes'}}}} | ConvertTo-Json
    Invoke-Restmethod -Method Post -Uri 'http://52.32.249.170:9200/kendex' -Body $b
}