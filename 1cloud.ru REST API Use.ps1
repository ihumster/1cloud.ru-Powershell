#Ключ API (нужно сгененрировать в панели управления https://panel.1cloud.ru/Account/Manage)
$apiKey='0c2d4d020e5a0b6d7sdfsdfsdf96ae41edasdd4f673asdasdfc4f4150fe5'


#Получить баланс
$uri = "https://api.1cloud.ru/customer/balance"
$balance = Invoke-RestMethod -Method Get -Uri $uri -Headers $header -ContentType 'application/json'
#Переменная $balance будет содержать значение баланса на счету

#Получить список серверов
$uri = "https://api.1cloud.ru/server"
$serversList = Invoke-RestMethod -Method Get -Uri $uri -Headers $header -ContentType 'application/json'
#В переменной $serversList получим массив элементов PSCustomObject или один элемент PSCustomObject
#посмотреть поля объекта можно в документации https://1cloud.ru/api/server/serverlist

#Получить список сетей
$uri = "https://api.1cloud.ru/network"
$networksList = Invoke-RestMethod -Method Get -Uri $uri -Headers $header -ContentType 'application/json'
#В переменной $networksList получим массив элементов PSCustomObject или один элемент PSCustomObject
#посмотреть поля объекта можно в документации https://1cloud.ru/api/network/networklist

#Создать новую сеть
$uri = "https://api.1cloud.ru/network"
$name = '{"Name":"TestNet"}'
$result = Invoke-RestMethod -Method Post -Uri $uri -Headers $header -ContentType 'application/json' -Body $name
#В переменной $name задаем имя сети, в переменной $result получаем параметры созданной сети
#Подробности в документации https://1cloud.ru/api/network/networkcreate

#Удалить сеть
$id = "231"
$uri = "https://api.1cloud.ru/network/$id"
Invoke-RestMethod -Method Delete -Uri $uri -Headers $header -ContentType 'application/json'
#В переменной $id номер сети для удаления, который можно получить с помощью запроса "Получить список сетей"
#Запрос не возвращает результата, если существует сеть с номером $id, она будет удалена