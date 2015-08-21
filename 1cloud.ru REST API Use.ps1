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

#Создать сервер
$uri = "https://api.1cloud.ru/server"
$serverSet = '{"Name":"testAPI","CPU":1,"RAM":1024,"HDD":40,"imageID":1,"HDDType":"SSD","IsHighPerformance":true}'
$res = = Invoke-RestMethod -Method Post -Uri $uri -Headers $header -ContentType 'application/json' -Body $serverSet
#В переменной $serverSet находится набор переменных для задания базовых параметорв виртуального сервера
#В переменной $res возвращаются выходные параметры сервера: ID, Name и т.п.
#Подробнее о входных и выходных параметрах можно узнать в документации https://1cloud.ru/api/server/createserver

#Выключить сервер
$id = "123"
$uri = "https://api.1cloud.ru/server/$id/action"
$action = '{"Type":"PowerOff"}'
$res = = Invoke-RestMethod -Method Post -Uri $uri -Headers $header -ContentType 'application/json' -Body $action
#В переменной $id задается номер сервера, получить который можно с помощью "Получить список серверов"
#В переменной $action задается тип действия (в данном примере выключение сервера)
#В переменной $res возвращается результат действия
#Подробнее о типах действий и выходных параметрах можно узнать в документации https://1cloud.ru/api/server/servercreateaction

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
