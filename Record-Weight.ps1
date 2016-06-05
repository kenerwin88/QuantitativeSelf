# Clear Index
function Record-Weight($Date, $Weight) {
    [Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")
    $Date = [datetime]$Date
    $Date = $Date.ToString("yyyy-MM-ddTHH:mm:ss.180Z")
    $metrics = @{
        "@timestamp" = $Date;
        "Weight" = $Weight;
    }

    $serializedMetric = new-object System.Text.StringBuilder
    $javaScriptSerializer = new-object System.Web.Script.Serialization.JavaScriptSerializer
    $javaScriptSerializer.Serialize($metrics, $serializedMetric);
    $ESEndPoint = "http://52.32.249.170:9200"
    $indexname = "kendex"
    $typename = "Weight"
    $id = [Guid]::NewGuid().ToString('n')
    $indexedEndpoint = $ESEndPoint + "/" + $indexname + "/" + $typename
    $webClient = new-object System.net.WebClient
    $webClient.UploadString($indexedEndpoint, $serializedMetric.ToString())
}
