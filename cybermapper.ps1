$key="XXXXXXXXXXXXXXXXXXXXX"
$location='-33.8670522%2C151.1957362'
$location='51.5285582%2C-0.2416782'
$radius='2000000'
$type='hospital'
$url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=cruise&location=$location&radius=$radius&type=$type&key=$key"

#$url

$results = (Invoke-WebRequest $url)

foreach($item in $results.Content){

$item| findstr 'http'
$object = $item | Convertfrom-json
$object1 = $object.results

foreach($element in $object1){
#$element.place_id
$placeID = $element.place_id.ToString()
#$element.name
#$element.business_status
#$element.types


#Query the place again
$detailurl = "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$key"
$placeresults = (Invoke-WebRequest $detailurl)
#$placeresults
$placedetailsinfo = $placeresults.Content | ConvertFrom-Json
foreach($newelement in $placedetailsinfo.result){
$newelement.website
}

}
}
