import 'dart:convert';
/// league : {"id":"3c6d318a-6164-4290-9bbc-bf9bb21cc4b8","name":"National Football League","alias":"NFL"}
/// conferences : [{"id":"1bdefe12-6cb2-4d6a-b208-b04602ae79c3","name":"AFC","alias":"AFC","divisions":[{"id":"324decdd-aa1b-4074-8958-c009d8fac31a","name":"AFC West","alias":"AFC_WEST","teams":[{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418","venue":{"id":"6589e61d-ef1e-4e30-91b5-9acd2072b8a0","name":"Empower Field at Mile High","city":"Denver","state":"CO","country":"USA","zip":"80204","address":"1701 Mile High Stadium Circle","capacity":76125,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8179","location":{"lat":"39.743865","lng":"-105.020158"}},"franchise":{"id":"32e2db10-be6d-41ed-9e3d-5b30ba164b99","name":"Broncos","alias":"DEN"},"team_colors":[{"type":"secondary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]},{"id":"1f6dcffb-9823-43cd-9ff4-e7a8466749b5","name":"Chargers","market":"Los Angeles","alias":"LAC","sr_id":"sr:competitor:4429","venue":{"id":"790c1f04-73c6-4f6f-8b1e-78a62260be90","name":"SoFi Stadium","city":"Inglewood","state":"CA","country":"USA","zip":"90301","address":"1000 S Prairie Ave","capacity":70240,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:52183","location":{"lat":"33.953536","lng":"-118.338734"}},"franchise":{"id":"a74d513a-dd7f-440d-a366-249f8f8dd97d","name":"Chargers","alias":"LAC"},"team_colors":[{"type":"primary","hex_color":"#002a5e","alpha":0,"rgb_color":{"red":0,"green":42,"blue":94}},{"type":"secondary","hex_color":"#ffc20e","alpha":0,"rgb_color":{"red":255,"green":194,"blue":14}}]},{"id":"6680d28d-d4d2-49f6-aace-5292d3ec02c2","name":"Chiefs","market":"Kansas City","alias":"KC","sr_id":"sr:competitor:4422","venue":{"id":"2ec4c411-dac2-403d-b091-6b6aa4a0a914","name":"GEHA Field at Arrowhead Stadium","city":"Kansas City","state":"MO","country":"USA","zip":"64129","address":"One Arrowhead Drive","capacity":76416,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8189","location":{"lat":"39.049019","lng":"-94.484140"}},"franchise":{"id":"5d239f9e-ef6a-46a6-83c2-94500fd119be","name":"Chiefs","alias":"KC"},"team_colors":[{"type":"secondary","hex_color":"#ffb81c","alpha":0,"rgb_color":{"red":255,"green":184,"blue":28}},{"type":"primary","hex_color":"#e31837","alpha":0,"rgb_color":{"red":227,"green":24,"blue":55}}]},{"id":"7d4fcc64-9cb5-4d1b-8e75-8a906d1e1576","name":"Raiders","market":"Las Vegas","alias":"LV","sr_id":"sr:competitor:4390","venue":{"id":"53d42601-5dfb-40a7-bd94-da2c1d3a75e4","name":"Allegiant Stadium","city":"Las Vegas","state":"NV","country":"USA","zip":"89118","address":"3333 Al Davis Way","capacity":65000,"surface":"turf","roof_type":"dome","sr_id":"sr:venue:51543","location":{"lat":"36.090852","lng":"-115.183339"}},"franchise":{"id":"859f427c-5157-4b5a-90e4-066e83f46cc3","name":"Raiders","alias":"LV"}}]},{"id":"b95cd27d-d631-4fe1-bc05-0ae47fc0b14b","name":"AFC East","alias":"AFC_EAST","teams":[{"id":"768c92aa-75ff-4a43-bcc0-f2798c2e1724","name":"Bills","market":"Buffalo","alias":"BUF","sr_id":"sr:competitor:4376","venue":{"id":"e9e0828e-37fc-4238-a317-49037577dd55","name":"Highmark Stadium","city":"Orchard Park","state":"NY","country":"USA","zip":"14127","address":"One Bills Drive","capacity":71608,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:8171","location":{"lat":"42.773826","lng":"-78.786589"}},"franchise":{"id":"26f22bc6-1fb9-4c01-80cc-908342490651","name":"Bills","alias":"BUF"},"team_colors":[{"type":"secondary","hex_color":"#c60c30","alpha":0,"rgb_color":{"red":198,"green":12,"blue":48}},{"type":"primary","hex_color":"#00338d","alpha":0,"rgb_color":{"red":0,"green":51,"blue":141}}]},{"id":"4809ecb0-abd3-451d-9c4a-92a90b83ca06","name":"Dolphins","market":"Miami","alias":"MIA","sr_id":"sr:competitor:4287","venue":{"id":"50a5c833-1570-4c38-abc7-7914cf87dbde","name":"Hard Rock Stadium","city":"Miami Gardens","state":"FL","country":"USA","zip":"33056","address":"2269 Northwest 199th Street","capacity":65326,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:21306","location":{"lat":"25.958025","lng":"-80.238724"}},"franchise":{"id":"d20c28e5-568a-4a6e-8b17-a8b2108e0eb9","name":"Dolphins","alias":"MIA"},"team_colors":[{"type":"secondary","hex_color":"#fc4c02","alpha":0,"rgb_color":{"red":252,"green":76,"blue":2}},{"type":"primary","hex_color":"#008e97","alpha":0,"rgb_color":{"red":0,"green":142,"blue":151}}]},{"id":"5fee86ae-74ab-4bdd-8416-42a9dd9964f3","name":"Jets","market":"New York","alias":"NYJ","sr_id":"sr:competitor:4427","venue":{"id":"5d4c85c7-d84e-4e10-bd6a-8a15ebecca5c","name":"MetLife Stadium","city":"East Rutherford","state":"NJ","country":"USA","zip":"07073","address":"One MetLife Stadium Drive","capacity":82500,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:1981","location":{"lat":"40.813611","lng":"-74.074444"}},"franchise":{"id":"7952ab69-46f3-4477-8ea8-903620bc0f34","name":"Jets","alias":"NYJ"},"team_colors":[{"type":"primary","hex_color":"#125740","alpha":0,"rgb_color":{"red":18,"green":87,"blue":64}},{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}}]},{"id":"97354895-8c77-4fd4-a860-32e62ea7382a","name":"Patriots","market":"New England","alias":"NE","sr_id":"sr:competitor:4424","venue":{"id":"e43310b1-cb82-4df9-8be5-e9b39637031b","name":"Gillette Stadium","city":"Foxborough","state":"MA","country":"USA","zip":"02035","address":"One Patriot Place","capacity":66829,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:2379","location":{"lat":"42.090944","lng":"-71.264344"}},"franchise":{"id":"c95b688d-810a-4323-9dad-fa3696ed8a37","name":"Patriots","alias":"NE"},"team_colors":[{"type":"secondary","hex_color":"#c60c30","alpha":0,"rgb_color":{"red":198,"green":12,"blue":48}},{"type":"primary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}}]}]},{"id":"e447e7c0-5997-4bb7-bea3-aaae48aedcb8","name":"AFC South","alias":"AFC_SOUTH","teams":[{"id":"82cf9565-6eb9-4f01-bdbd-5aa0d472fcd9","name":"Colts","market":"Indianapolis","alias":"IND","sr_id":"sr:competitor:4421","venue":{"id":"6ed18563-53e0-46c2-a91d-12d73a16456d","name":"Lucas Oil Stadium","city":"Indianapolis","state":"IN","country":"USA","zip":"46225","address":"500 South Capitol Avenue","capacity":67000,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:8185","location":{"lat":"39.760008","lng":"-86.163906"}},"franchise":{"id":"2fef583c-e5eb-49b6-ad33-fb4e1734326f","name":"Colts","alias":"IND"},"team_colors":[{"type":"primary","hex_color":"#002c5f","alpha":0,"rgb_color":{"red":0,"green":44,"blue":95}},{"type":"secondary","hex_color":"#a2aaad","alpha":0,"rgb_color":{"red":162,"green":170,"blue":173}}]},{"id":"f7ddd7fa-0bae-4f90-bc8e-669e4d6cf2de","name":"Jaguars","market":"Jacksonville","alias":"JAC","sr_id":"sr:competitor:4386","venue":{"id":"4c5c036d-dd3d-4183-b595-71a43a97560f","name":"TIAA Bank Field","city":"Jacksonville","state":"FL","country":"USA","zip":"32202","address":"One EverBank Field Drive","capacity":69132,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8187","location":{"lat":"30.324027","lng":"-81.637239"}},"franchise":{"id":"06cfabbf-ebd8-48b3-a9a8-9bfbc1d45272","name":"Jaguars","alias":"JAC"},"team_colors":[{"type":"primary","hex_color":"#101820","alpha":0,"rgb_color":{"red":16,"green":24,"blue":32}},{"type":"secondary","hex_color":"#d7a22a","alpha":0,"rgb_color":{"red":215,"green":162,"blue":42}}]},{"id":"82d2d380-3834-4938-835f-aec541e5ece7","name":"Texans","market":"Houston","alias":"HOU","sr_id":"sr:competitor:4324","venue":{"id":"6a72e5ca-33d0-40af-8e6b-b32a4d3d9346","name":"NRG Stadium","city":"Houston","state":"TX","country":"USA","zip":"77054","address":"One Reliant Park","capacity":72220,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:2402","location":{"lat":"29.684735","lng":"-95.410725"}},"franchise":{"id":"0b23e38e-a1f2-44e5-97c5-70b6a0fa2ff0","name":"Texans","alias":"HOU"},"team_colors":[{"type":"primary","hex_color":"#03202f","alpha":0,"rgb_color":{"red":3,"green":32,"blue":47}},{"type":"secondary","hex_color":"#a71930","alpha":0,"rgb_color":{"red":167,"green":25,"blue":48}}]},{"id":"d26a1ca5-722d-4274-8f97-c92e49c96315","name":"Titans","market":"Tennessee","alias":"TEN","sr_id":"sr:competitor:367364","venue":{"id":"5295c1b7-c85c-49cb-9569-1707c65324e5","name":"Nissan Stadium","city":"Nashville","state":"TN","country":"USA","zip":"37213","address":"One Titans Way","capacity":69143,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8207","location":{"lat":"36.166367","lng":"-86.771223"}},"franchise":{"id":"0599bd1c-ffb7-46fe-884a-604933de6834","name":"Titans","alias":"TEN"},"team_colors":[{"type":"primary","hex_color":"#0c2340","alpha":0,"rgb_color":{"red":12,"green":35,"blue":64}},{"type":"secondary","hex_color":"#418fde","alpha":0,"rgb_color":{"red":65,"green":143,"blue":222}}]}]},{"id":"eb60da78-4eb5-4184-971e-2c5cd4ab4988","name":"AFC North","alias":"AFC_NORTH","teams":[{"id":"ad4ae08f-d808-42d5-a1e6-e9bc4e34d123","name":"Bengals","market":"Cincinnati","alias":"CIN","sr_id":"sr:competitor:4416","venue":{"id":"b87a1595-d3c8-48ea-8a53-0aab6378a64a","name":"Paul Brown Stadium","city":"Cincinnati","state":"OH","country":"USA","zip":"45202","address":"One Paul Brown Stadium","capacity":65515,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:8175","location":{"lat":"39.095413","lng":"-84.516204"}},"franchise":{"id":"fee0985c-3330-40ce-9b7d-a396ccb8d032","name":"Bengals","alias":"CIN"},"team_colors":[{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]},{"id":"d5a2eb42-8065-4174-ab79-0a6fa820e35e","name":"Browns","market":"Cleveland","alias":"CLE","sr_id":"sr:competitor:4417","venue":{"id":"90c38d91-3774-4f5d-82ca-1c806828219f","name":"FirstEnergy Stadium","city":"Cleveland","state":"OH","country":"USA","zip":"44114","address":"100 Alfred Lerner Way","capacity":67895,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8177","location":{"lat":"41.506054","lng":"-81.700004"}},"franchise":{"id":"419d8ce3-3352-429e-a8ba-0e89891fca3e","name":"Browns","alias":"CLE"},"team_colors":[{"type":"secondary","hex_color":"#ff3c00","alpha":0,"rgb_color":{"red":255,"green":60,"blue":0}},{"type":"primary","hex_color":"#311d00","alpha":0,"rgb_color":{"red":49,"green":29,"blue":0}}]},{"id":"ebd87119-b331-4469-9ea6-d51fe3ce2f1c","name":"Ravens","market":"Baltimore","alias":"BAL","sr_id":"sr:competitor:4413","venue":{"id":"d54faae0-0314-484f-8604-9d8dd08e1149","name":"M&T Bank Stadium","city":"Baltimore","state":"MD","country":"USA","zip":"21230","address":"1101 Russell Street","capacity":71008,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8169","location":{"lat":"39.277995","lng":"-76.622592"}},"franchise":{"id":"677f94d8-2228-47be-881f-6680fd0af994","name":"Ravens","alias":"BAL"},"team_colors":[{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}},{"type":"primary","hex_color":"#1a195f","alpha":0,"rgb_color":{"red":26,"green":25,"blue":95}}]},{"id":"cb2f9f1f-ac67-424e-9e72-1475cb0ed398","name":"Steelers","market":"Pittsburgh","alias":"PIT","sr_id":"sr:competitor:4345","venue":{"id":"7349a2e6-0ac9-410b-8bd2-ca58c9f7aa34","name":"Heinz Field","city":"Pittsburgh","state":"PA","country":"USA","zip":"15212","address":"100 Art Rooney Avenue","capacity":68400,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8197","location":{"lat":"40.446653","lng":"-80.015844"}},"franchise":{"id":"8dfe8626-6970-4e88-90dd-ea735c3d5cc3","name":"Steelers","alias":"PIT"},"team_colors":[{"type":"primary","hex_color":"#ffb612","alpha":0,"rgb_color":{"red":255,"green":182,"blue":18}},{"type":"secondary","hex_color":"#101820","alpha":0,"rgb_color":{"red":16,"green":24,"blue":32}}]}]}]},{"id":"b1808e5f-d40b-47c0-8af8-5175c0fdcd26","name":"NFC","alias":"NFC","divisions":[{"id":"2a46bf95-b036-4c6c-b69f-a80c4b6c46bf","name":"NFC South","alias":"NFC_SOUTH","teams":[{"id":"4254d319-1bc7-4f81-b4ab-b5e6f3402b69","name":"Buccaneers","market":"Tampa Bay","alias":"TB","sr_id":"sr:competitor:4388","venue":{"id":"6fccc39c-80bc-4c81-83d9-2d5a848c8c09","name":"Raymond James Stadium","city":"Tampa","state":"FL","country":"USA","zip":"33607","address":"4201 North Dale Mabry Highway","capacity":65890,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8205","location":{"lat":"27.976211","lng":"-82.503625"}},"franchise":{"id":"e3790b3a-f7fc-4c19-8016-3e29b623f6d0","name":"Buccaneers","alias":"TB"},"team_colors":[{"type":"secondary","hex_color":"#0a0a08","alpha":0,"rgb_color":{"red":10,"green":10,"blue":8}},{"type":"primary","hex_color":"#d50a0a","alpha":0,"rgb_color":{"red":213,"green":10,"blue":10}}]},{"id":"e6aa13a4-0055-48a9-bc41-be28dc106929","name":"Falcons","market":"Atlanta","alias":"ATL","sr_id":"sr:competitor:4393","venue":{"id":"1f2d393b-2291-4835-a412-0714966ea245","name":"Mercedes-Benz Stadium","city":"Atlanta","state":"GA","country":"USA","zip":"30313","address":"441 Martin Luther King Jr Drive NW","capacity":71000,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:20343","location":{"lat":"33.757368","lng":"-84.401008"}},"franchise":{"id":"927a1bb6-f1a5-42f0-b059-c448fdb5f8bb","name":"Falcons","alias":"ATL"},"team_colors":[{"type":"primary","hex_color":"#a71930","alpha":0,"rgb_color":{"red":167,"green":25,"blue":48}},{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}}]},{"id":"f14bf5cc-9a82-4a38-bc15-d39f75ed5314","name":"Panthers","market":"Carolina","alias":"CAR","sr_id":"sr:competitor:4415","venue":{"id":"39be9ed4-3292-49ac-8699-a381de3a4969","name":"Bank of America Stadium","city":"Charlotte","state":"NC","country":"USA","zip":"28202","address":"800 South Mint Street","capacity":75419,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:8173","location":{"lat":"35.225937","lng":"-80.853133"}},"franchise":{"id":"ab08c41f-7e6d-4399-9750-7ef1c6d6d4e0","name":"Panthers","alias":"CAR"},"team_colors":[{"type":"primary","hex_color":"#0085ca","alpha":0,"rgb_color":{"red":0,"green":133,"blue":202}},{"type":"secondary","hex_color":"#101820","alpha":0,"rgb_color":{"red":16,"green":24,"blue":32}}]},{"id":"0d855753-ea21-4953-89f9-0e20aff9eb73","name":"Saints","market":"New Orleans","alias":"NO","sr_id":"sr:competitor:4425","venue":{"id":"3c85d89a-ec66-4983-acd5-1381d6c8673a","name":"Caesars Superdome","city":"New Orleans","state":"LA","country":"USA","zip":"70112","address":"1500 Sugar Bowl Drive","capacity":73208,"surface":"artificial","roof_type":"dome","sr_id":"sr:venue:8195","location":{"lat":"29.950928","lng":"-90.080876"}},"franchise":{"id":"bdf043f4-8199-4f76-92ea-5604cc53ad12","name":"Saints","alias":"NO"},"team_colors":[{"type":"primary","hex_color":"#d3bc8d","alpha":0,"rgb_color":{"red":211,"green":188,"blue":141}},{"type":"secondary","hex_color":"#10181f","alpha":0,"rgb_color":{"red":16,"green":24,"blue":31}}]}]},{"id":"390d000d-9949-42e6-bf5e-b166dc463675","name":"NFC West","alias":"NFC_WEST","teams":[{"id":"f0e724b0-4cbf-495a-be47-013907608da9","name":"49ers","market":"San Francisco","alias":"SF","sr_id":"sr:competitor:4389","venue":{"id":"24c71dbf-6469-46f1-8165-22005c295c8f","name":"Levi's Stadium","city":"Santa Clara","state":"CA","country":"USA","zip":"95054","address":"4900 Marie P DeBartolo Way","capacity":68500,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:15672","location":{"lat":"37.403000","lng":"-121.970000"}},"franchise":{"id":"ae0820f5-8beb-4c51-80ad-948f8810613d","name":"49ers","alias":"SF"},"team_colors":[{"type":"primary","hex_color":"#aa0000","alpha":0,"rgb_color":{"red":170,"green":0,"blue":0}},{"type":"secondary","hex_color":"#ad995d","alpha":0,"rgb_color":{"red":173,"green":153,"blue":93}}]},{"id":"de760528-1dc0-416a-a978-b510d20692ff","name":"Cardinals","market":"Arizona","alias":"ARI","sr_id":"sr:competitor:4412","venue":{"id":"f8e4d2ab-53f9-4e9f-8c4a-9bc278094a84","name":"State Farm Stadium","city":"Glendale","state":"AZ","country":"USA","zip":"85305","address":"One Cardinals Drive","capacity":63400,"surface":"turf","roof_type":"retractable_dome","sr_id":"sr:venue:8165","location":{"lat":"33.527765","lng":"-112.262090"}},"franchise":{"id":"549f433e-a3be-4fd6-a90f-c864bd59d4ed","name":"Cardinals","alias":"ARI"},"team_colors":[{"type":"primary","hex_color":"#97233f","alpha":0,"rgb_color":{"red":151,"green":35,"blue":63}},{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}}]},{"id":"2eff2a03-54d4-46ba-890e-2bc3925548f3","name":"Rams","market":"Los Angeles","alias":"LA","sr_id":"sr:competitor:4387","venue":{"id":"790c1f04-73c6-4f6f-8b1e-78a62260be90","name":"SoFi Stadium","city":"Inglewood","state":"CA","country":"USA","zip":"90301","address":"1000 S Prairie Ave","capacity":70240,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:52183","location":{"lat":"33.953536","lng":"-118.338734"}},"franchise":{"id":"6947fd02-bb27-4f11-93da-c7c5baab53dc","name":"Rams","alias":"LA"},"team_colors":[{"type":"primary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"secondary","hex_color":"#866d4b","alpha":0,"rgb_color":{"red":134,"green":109,"blue":75}}]},{"id":"3d08af9e-c767-4f88-a7dc-b920c6d2b4a8","name":"Seahawks","market":"Seattle","alias":"SEA","sr_id":"sr:competitor:4430","venue":{"id":"c6b9e5df-c9e4-434c-b3e6-83928f11cbda","name":"Lumen Field","city":"Seattle","state":"WA","country":"USA","zip":"98134","address":"800 Occidental Avenue South","capacity":68000,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:2291","location":{"lat":"47.595165","lng":"-122.331650"}},"franchise":{"id":"a52ddba9-4709-4b76-8b1b-d9561607f7ec","name":"Seahawks","alias":"SEA"},"team_colors":[{"type":"primary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"secondary","hex_color":"#69be28","alpha":0,"rgb_color":{"red":105,"green":190,"blue":40}}]}]},{"id":"6dab3ca1-b9cb-403f-91dd-b2a3708ab060","name":"NFC East","alias":"NFC_EAST","teams":[{"id":"22052ff7-c065-42ee-bc8f-c4691c50e624","name":"Commanders","market":"Washington","alias":"WAS","sr_id":"sr:competitor:4432","venue":{"id":"7c11bb2d-4a53-4842-b842-0f1c63ed78e9","name":"FedExField","city":"Landover","state":"MD","country":"USA","zip":"20785","address":"1600 FedEx Way","capacity":82000,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:6652","location":{"lat":"38.907724","lng":"-76.864613"}},"franchise":{"id":"d7376957-e63b-4bc9-b82b-d087fc0ec83a","name":"Commanders","alias":"WAS"},"team_colors":[{"type":"secondary","hex_color":"#ffb612","alpha":0,"rgb_color":{"red":255,"green":182,"blue":18}},{"type":"primary","hex_color":"#3f1010","alpha":0,"rgb_color":{"red":63,"green":16,"blue":16}}]},{"id":"e627eec7-bbae-4fa4-8e73-8e1d6bc5c060","name":"Cowboys","market":"Dallas","alias":"DAL","sr_id":"sr:competitor:4392","venue":{"id":"1e84213a-ff1f-4c9d-a003-8ee782b25a40","name":"AT&T Stadium","city":"Arlington","state":"TX","country":"USA","zip":"76011","address":"One Legends Way","capacity":80000,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:6650","location":{"lat":"32.747778","lng":"-97.092778"}},"franchise":{"id":"1e0f7b34-9603-412e-bcb6-358dbe5e9d6a","name":"Cowboys","alias":"DAL"},"team_colors":[{"type":"secondary","hex_color":"#869397","alpha":0,"rgb_color":{"red":134,"green":147,"blue":151}},{"type":"primary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}}]},{"id":"386bdbf9-9eea-4869-bb9a-274b0bc66e80","name":"Eagles","market":"Philadelphia","alias":"PHI","sr_id":"sr:competitor:4428","venue":{"id":"4fa8c29c-6626-464c-8540-314ed7535e1b","name":"Lincoln Financial Field","city":"Philadelphia","state":"PA","country":"USA","zip":"19148","address":"1020 Pattison Avenue","capacity":69596,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:1833","location":{"lat":"39.900872","lng":"-75.167311"}},"franchise":{"id":"8eefc537-0493-4de8-8d64-2c091d3f5887","name":"Eagles","alias":"PHI"},"team_colors":[{"type":"secondary","hex_color":"#a5acaf","alpha":0,"rgb_color":{"red":165,"green":172,"blue":175}},{"type":"primary","hex_color":"#004c54","alpha":0,"rgb_color":{"red":0,"green":76,"blue":84}}]},{"id":"04aa1c9d-66da-489d-b16a-1dee3f2eec4d","name":"Giants","market":"New York","alias":"NYG","sr_id":"sr:competitor:4426","venue":{"id":"5d4c85c7-d84e-4e10-bd6a-8a15ebecca5c","name":"MetLife Stadium","city":"East Rutherford","state":"NJ","country":"USA","zip":"07073","address":"One MetLife Stadium Drive","capacity":82500,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:1981","location":{"lat":"40.813611","lng":"-74.074444"}},"franchise":{"id":"ba82e47e-a7b4-47a6-8017-1f41b1f02271","name":"Giants","alias":"NYG"},"team_colors":[{"type":"secondary","hex_color":"#a30d2d","alpha":0,"rgb_color":{"red":163,"green":13,"blue":45}},{"type":"primary","hex_color":"#012352","alpha":0,"rgb_color":{"red":1,"green":35,"blue":82}}]}]},{"id":"6dc1933f-ca90-46e6-aaf7-9b95cc44306a","name":"NFC North","alias":"NFC_NORTH","teams":[{"id":"7b112545-38e6-483c-a55c-96cf6ee49cb8","name":"Bears","market":"Chicago","alias":"CHI","sr_id":"sr:competitor:4391","venue":{"id":"d7866605-5ac6-4b3a-90e8-760cc5a26b75","name":"Soldier Field","city":"Chicago","state":"IL","country":"USA","zip":"60605","address":"1410 South Museum Campus Drive","capacity":61500,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:2109","location":{"lat":"41.862498","lng":"-87.616979"}},"franchise":{"id":"70444634-4a2d-4d63-8bb8-4100da905e0b","name":"Bears","alias":"CHI"},"team_colors":[{"type":"secondary","hex_color":"#c83803","alpha":0,"rgb_color":{"red":200,"green":56,"blue":3}},{"type":"primary","hex_color":"#0b162a","alpha":0,"rgb_color":{"red":11,"green":22,"blue":42}}]},{"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419","venue":{"id":"6e3bcf22-277d-4c06-b019-62aded51654f","name":"Ford Field","city":"Detroit","state":"MI","country":"USA","zip":"48226","address":"2000 Brush Street","capacity":65000,"surface":"artificial","roof_type":"dome","sr_id":"sr:venue:8181","location":{"lat":"42.339958","lng":"-83.045636"}},"franchise":{"id":"6e9e3a7d-d35d-47a2-bc8d-4855fe35ab7a","name":"Lions","alias":"DET"},"team_colors":[{"type":"secondary","hex_color":"#b0b7bc","alpha":0,"rgb_color":{"red":176,"green":183,"blue":188}},{"type":"primary","hex_color":"#0076b6","alpha":0,"rgb_color":{"red":0,"green":118,"blue":182}}]},{"id":"a20471b4-a8d9-40c7-95ad-90cc30e46932","name":"Packers","market":"Green Bay","alias":"GB","sr_id":"sr:competitor:4420","venue":{"id":"5a60dd3a-302c-41c6-ab0f-dd335c1103c2","name":"Lambeau Field","city":"Green Bay","state":"WI","country":"USA","zip":"54304","address":"1265 Lombardi Avenue","capacity":81435,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8183","location":{"lat":"44.501357","lng":"-88.062440"}},"franchise":{"id":"d06bf286-748f-4482-b256-8be705d41d16","name":"Packers","alias":"GB"},"team_colors":[{"type":"secondary","hex_color":"#ffb81c","alpha":0,"rgb_color":{"red":255,"green":184,"blue":28}},{"type":"primary","hex_color":"#183028","alpha":0,"rgb_color":{"red":24,"green":48,"blue":40}}]},{"id":"33405046-04ee-4058-a950-d606f8c30852","name":"Vikings","market":"Minnesota","alias":"MIN","sr_id":"sr:competitor:4423","venue":{"id":"f5ff00d4-1ed8-4918-bf73-13d66d510f98","name":"U.S. Bank Stadium","city":"Minneapolis","state":"MN","country":"USA","zip":"55415","address":"900 S 5th Street","capacity":66655,"surface":"artificial","roof_type":"dome","sr_id":"sr:venue:18423","location":{"lat":"44.973686","lng":"-93.257458"}},"franchise":{"id":"eea5f772-bd6b-4dc6-a7ef-118708f3a726","name":"Vikings","alias":"MIN"},"team_colors":[{"type":"secondary","hex_color":"#ffc62f","alpha":0,"rgb_color":{"red":255,"green":198,"blue":47}},{"type":"primary","hex_color":"#4f2683","alpha":0,"rgb_color":{"red":79,"green":38,"blue":131}}]}]}]}]

TeamsResponse teamsResponseFromJson(String str) => TeamsResponse.fromJson(json.decode(str));
String teamsResponseToJson(TeamsResponse data) => json.encode(data.toJson());
class TeamsResponse {
  TeamsResponse({
      League? league, 
      List<Conferences>? conferences,}){
    _league = league;
    _conferences = conferences;
}

  TeamsResponse.fromJson(dynamic json) {
    _league = json['league'] != null ? League.fromJson(json['league']) : null;
    if (json['conferences'] != null) {
      _conferences = [];
      json['conferences'].forEach((v) {
        _conferences?.add(Conferences.fromJson(v));
      });
    }
  }
  League? _league;
  List<Conferences>? _conferences;
TeamsResponse copyWith({  League? league,
  List<Conferences>? conferences,
}) => TeamsResponse(  league: league ?? _league,
  conferences: conferences ?? _conferences,
);
  League? get league => _league;
  List<Conferences>? get conferences => _conferences;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_league != null) {
      map['league'] = _league?.toJson();
    }
    if (_conferences != null) {
      map['conferences'] = _conferences?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1bdefe12-6cb2-4d6a-b208-b04602ae79c3"
/// name : "AFC"
/// alias : "AFC"
/// divisions : [{"id":"324decdd-aa1b-4074-8958-c009d8fac31a","name":"AFC West","alias":"AFC_WEST","teams":[{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418","venue":{"id":"6589e61d-ef1e-4e30-91b5-9acd2072b8a0","name":"Empower Field at Mile High","city":"Denver","state":"CO","country":"USA","zip":"80204","address":"1701 Mile High Stadium Circle","capacity":76125,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8179","location":{"lat":"39.743865","lng":"-105.020158"}},"franchise":{"id":"32e2db10-be6d-41ed-9e3d-5b30ba164b99","name":"Broncos","alias":"DEN"},"team_colors":[{"type":"secondary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]},{"id":"1f6dcffb-9823-43cd-9ff4-e7a8466749b5","name":"Chargers","market":"Los Angeles","alias":"LAC","sr_id":"sr:competitor:4429","venue":{"id":"790c1f04-73c6-4f6f-8b1e-78a62260be90","name":"SoFi Stadium","city":"Inglewood","state":"CA","country":"USA","zip":"90301","address":"1000 S Prairie Ave","capacity":70240,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:52183","location":{"lat":"33.953536","lng":"-118.338734"}},"franchise":{"id":"a74d513a-dd7f-440d-a366-249f8f8dd97d","name":"Chargers","alias":"LAC"},"team_colors":[{"type":"primary","hex_color":"#002a5e","alpha":0,"rgb_color":{"red":0,"green":42,"blue":94}},{"type":"secondary","hex_color":"#ffc20e","alpha":0,"rgb_color":{"red":255,"green":194,"blue":14}}]},{"id":"6680d28d-d4d2-49f6-aace-5292d3ec02c2","name":"Chiefs","market":"Kansas City","alias":"KC","sr_id":"sr:competitor:4422","venue":{"id":"2ec4c411-dac2-403d-b091-6b6aa4a0a914","name":"GEHA Field at Arrowhead Stadium","city":"Kansas City","state":"MO","country":"USA","zip":"64129","address":"One Arrowhead Drive","capacity":76416,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8189","location":{"lat":"39.049019","lng":"-94.484140"}},"franchise":{"id":"5d239f9e-ef6a-46a6-83c2-94500fd119be","name":"Chiefs","alias":"KC"},"team_colors":[{"type":"secondary","hex_color":"#ffb81c","alpha":0,"rgb_color":{"red":255,"green":184,"blue":28}},{"type":"primary","hex_color":"#e31837","alpha":0,"rgb_color":{"red":227,"green":24,"blue":55}}]},{"id":"7d4fcc64-9cb5-4d1b-8e75-8a906d1e1576","name":"Raiders","market":"Las Vegas","alias":"LV","sr_id":"sr:competitor:4390","venue":{"id":"53d42601-5dfb-40a7-bd94-da2c1d3a75e4","name":"Allegiant Stadium","city":"Las Vegas","state":"NV","country":"USA","zip":"89118","address":"3333 Al Davis Way","capacity":65000,"surface":"turf","roof_type":"dome","sr_id":"sr:venue:51543","location":{"lat":"36.090852","lng":"-115.183339"}},"franchise":{"id":"859f427c-5157-4b5a-90e4-066e83f46cc3","name":"Raiders","alias":"LV"}}]},{"id":"b95cd27d-d631-4fe1-bc05-0ae47fc0b14b","name":"AFC East","alias":"AFC_EAST","teams":[{"id":"768c92aa-75ff-4a43-bcc0-f2798c2e1724","name":"Bills","market":"Buffalo","alias":"BUF","sr_id":"sr:competitor:4376","venue":{"id":"e9e0828e-37fc-4238-a317-49037577dd55","name":"Highmark Stadium","city":"Orchard Park","state":"NY","country":"USA","zip":"14127","address":"One Bills Drive","capacity":71608,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:8171","location":{"lat":"42.773826","lng":"-78.786589"}},"franchise":{"id":"26f22bc6-1fb9-4c01-80cc-908342490651","name":"Bills","alias":"BUF"},"team_colors":[{"type":"secondary","hex_color":"#c60c30","alpha":0,"rgb_color":{"red":198,"green":12,"blue":48}},{"type":"primary","hex_color":"#00338d","alpha":0,"rgb_color":{"red":0,"green":51,"blue":141}}]},{"id":"4809ecb0-abd3-451d-9c4a-92a90b83ca06","name":"Dolphins","market":"Miami","alias":"MIA","sr_id":"sr:competitor:4287","venue":{"id":"50a5c833-1570-4c38-abc7-7914cf87dbde","name":"Hard Rock Stadium","city":"Miami Gardens","state":"FL","country":"USA","zip":"33056","address":"2269 Northwest 199th Street","capacity":65326,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:21306","location":{"lat":"25.958025","lng":"-80.238724"}},"franchise":{"id":"d20c28e5-568a-4a6e-8b17-a8b2108e0eb9","name":"Dolphins","alias":"MIA"},"team_colors":[{"type":"secondary","hex_color":"#fc4c02","alpha":0,"rgb_color":{"red":252,"green":76,"blue":2}},{"type":"primary","hex_color":"#008e97","alpha":0,"rgb_color":{"red":0,"green":142,"blue":151}}]},{"id":"5fee86ae-74ab-4bdd-8416-42a9dd9964f3","name":"Jets","market":"New York","alias":"NYJ","sr_id":"sr:competitor:4427","venue":{"id":"5d4c85c7-d84e-4e10-bd6a-8a15ebecca5c","name":"MetLife Stadium","city":"East Rutherford","state":"NJ","country":"USA","zip":"07073","address":"One MetLife Stadium Drive","capacity":82500,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:1981","location":{"lat":"40.813611","lng":"-74.074444"}},"franchise":{"id":"7952ab69-46f3-4477-8ea8-903620bc0f34","name":"Jets","alias":"NYJ"},"team_colors":[{"type":"primary","hex_color":"#125740","alpha":0,"rgb_color":{"red":18,"green":87,"blue":64}},{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}}]},{"id":"97354895-8c77-4fd4-a860-32e62ea7382a","name":"Patriots","market":"New England","alias":"NE","sr_id":"sr:competitor:4424","venue":{"id":"e43310b1-cb82-4df9-8be5-e9b39637031b","name":"Gillette Stadium","city":"Foxborough","state":"MA","country":"USA","zip":"02035","address":"One Patriot Place","capacity":66829,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:2379","location":{"lat":"42.090944","lng":"-71.264344"}},"franchise":{"id":"c95b688d-810a-4323-9dad-fa3696ed8a37","name":"Patriots","alias":"NE"},"team_colors":[{"type":"secondary","hex_color":"#c60c30","alpha":0,"rgb_color":{"red":198,"green":12,"blue":48}},{"type":"primary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}}]}]},{"id":"e447e7c0-5997-4bb7-bea3-aaae48aedcb8","name":"AFC South","alias":"AFC_SOUTH","teams":[{"id":"82cf9565-6eb9-4f01-bdbd-5aa0d472fcd9","name":"Colts","market":"Indianapolis","alias":"IND","sr_id":"sr:competitor:4421","venue":{"id":"6ed18563-53e0-46c2-a91d-12d73a16456d","name":"Lucas Oil Stadium","city":"Indianapolis","state":"IN","country":"USA","zip":"46225","address":"500 South Capitol Avenue","capacity":67000,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:8185","location":{"lat":"39.760008","lng":"-86.163906"}},"franchise":{"id":"2fef583c-e5eb-49b6-ad33-fb4e1734326f","name":"Colts","alias":"IND"},"team_colors":[{"type":"primary","hex_color":"#002c5f","alpha":0,"rgb_color":{"red":0,"green":44,"blue":95}},{"type":"secondary","hex_color":"#a2aaad","alpha":0,"rgb_color":{"red":162,"green":170,"blue":173}}]},{"id":"f7ddd7fa-0bae-4f90-bc8e-669e4d6cf2de","name":"Jaguars","market":"Jacksonville","alias":"JAC","sr_id":"sr:competitor:4386","venue":{"id":"4c5c036d-dd3d-4183-b595-71a43a97560f","name":"TIAA Bank Field","city":"Jacksonville","state":"FL","country":"USA","zip":"32202","address":"One EverBank Field Drive","capacity":69132,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8187","location":{"lat":"30.324027","lng":"-81.637239"}},"franchise":{"id":"06cfabbf-ebd8-48b3-a9a8-9bfbc1d45272","name":"Jaguars","alias":"JAC"},"team_colors":[{"type":"primary","hex_color":"#101820","alpha":0,"rgb_color":{"red":16,"green":24,"blue":32}},{"type":"secondary","hex_color":"#d7a22a","alpha":0,"rgb_color":{"red":215,"green":162,"blue":42}}]},{"id":"82d2d380-3834-4938-835f-aec541e5ece7","name":"Texans","market":"Houston","alias":"HOU","sr_id":"sr:competitor:4324","venue":{"id":"6a72e5ca-33d0-40af-8e6b-b32a4d3d9346","name":"NRG Stadium","city":"Houston","state":"TX","country":"USA","zip":"77054","address":"One Reliant Park","capacity":72220,"surface":"artificial","roof_type":"retractable_dome","sr_id":"sr:venue:2402","location":{"lat":"29.684735","lng":"-95.410725"}},"franchise":{"id":"0b23e38e-a1f2-44e5-97c5-70b6a0fa2ff0","name":"Texans","alias":"HOU"},"team_colors":[{"type":"primary","hex_color":"#03202f","alpha":0,"rgb_color":{"red":3,"green":32,"blue":47}},{"type":"secondary","hex_color":"#a71930","alpha":0,"rgb_color":{"red":167,"green":25,"blue":48}}]},{"id":"d26a1ca5-722d-4274-8f97-c92e49c96315","name":"Titans","market":"Tennessee","alias":"TEN","sr_id":"sr:competitor:367364","venue":{"id":"5295c1b7-c85c-49cb-9569-1707c65324e5","name":"Nissan Stadium","city":"Nashville","state":"TN","country":"USA","zip":"37213","address":"One Titans Way","capacity":69143,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8207","location":{"lat":"36.166367","lng":"-86.771223"}},"franchise":{"id":"0599bd1c-ffb7-46fe-884a-604933de6834","name":"Titans","alias":"TEN"},"team_colors":[{"type":"primary","hex_color":"#0c2340","alpha":0,"rgb_color":{"red":12,"green":35,"blue":64}},{"type":"secondary","hex_color":"#418fde","alpha":0,"rgb_color":{"red":65,"green":143,"blue":222}}]}]},{"id":"eb60da78-4eb5-4184-971e-2c5cd4ab4988","name":"AFC North","alias":"AFC_NORTH","teams":[{"id":"ad4ae08f-d808-42d5-a1e6-e9bc4e34d123","name":"Bengals","market":"Cincinnati","alias":"CIN","sr_id":"sr:competitor:4416","venue":{"id":"b87a1595-d3c8-48ea-8a53-0aab6378a64a","name":"Paul Brown Stadium","city":"Cincinnati","state":"OH","country":"USA","zip":"45202","address":"One Paul Brown Stadium","capacity":65515,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:8175","location":{"lat":"39.095413","lng":"-84.516204"}},"franchise":{"id":"fee0985c-3330-40ce-9b7d-a396ccb8d032","name":"Bengals","alias":"CIN"},"team_colors":[{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]},{"id":"d5a2eb42-8065-4174-ab79-0a6fa820e35e","name":"Browns","market":"Cleveland","alias":"CLE","sr_id":"sr:competitor:4417","venue":{"id":"90c38d91-3774-4f5d-82ca-1c806828219f","name":"FirstEnergy Stadium","city":"Cleveland","state":"OH","country":"USA","zip":"44114","address":"100 Alfred Lerner Way","capacity":67895,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8177","location":{"lat":"41.506054","lng":"-81.700004"}},"franchise":{"id":"419d8ce3-3352-429e-a8ba-0e89891fca3e","name":"Browns","alias":"CLE"},"team_colors":[{"type":"secondary","hex_color":"#ff3c00","alpha":0,"rgb_color":{"red":255,"green":60,"blue":0}},{"type":"primary","hex_color":"#311d00","alpha":0,"rgb_color":{"red":49,"green":29,"blue":0}}]},{"id":"ebd87119-b331-4469-9ea6-d51fe3ce2f1c","name":"Ravens","market":"Baltimore","alias":"BAL","sr_id":"sr:competitor:4413","venue":{"id":"d54faae0-0314-484f-8604-9d8dd08e1149","name":"M&T Bank Stadium","city":"Baltimore","state":"MD","country":"USA","zip":"21230","address":"1101 Russell Street","capacity":71008,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8169","location":{"lat":"39.277995","lng":"-76.622592"}},"franchise":{"id":"677f94d8-2228-47be-881f-6680fd0af994","name":"Ravens","alias":"BAL"},"team_colors":[{"type":"secondary","hex_color":"#000000","alpha":0,"rgb_color":{"red":0,"green":0,"blue":0}},{"type":"primary","hex_color":"#1a195f","alpha":0,"rgb_color":{"red":26,"green":25,"blue":95}}]},{"id":"cb2f9f1f-ac67-424e-9e72-1475cb0ed398","name":"Steelers","market":"Pittsburgh","alias":"PIT","sr_id":"sr:competitor:4345","venue":{"id":"7349a2e6-0ac9-410b-8bd2-ca58c9f7aa34","name":"Heinz Field","city":"Pittsburgh","state":"PA","country":"USA","zip":"15212","address":"100 Art Rooney Avenue","capacity":68400,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8197","location":{"lat":"40.446653","lng":"-80.015844"}},"franchise":{"id":"8dfe8626-6970-4e88-90dd-ea735c3d5cc3","name":"Steelers","alias":"PIT"},"team_colors":[{"type":"primary","hex_color":"#ffb612","alpha":0,"rgb_color":{"red":255,"green":182,"blue":18}},{"type":"secondary","hex_color":"#101820","alpha":0,"rgb_color":{"red":16,"green":24,"blue":32}}]}]}]

Conferences conferencesFromJson(String str) => Conferences.fromJson(json.decode(str));
String conferencesToJson(Conferences data) => json.encode(data.toJson());
class Conferences {
  Conferences({
      String? id, 
      String? name, 
      String? alias, 
      List<Divisions>? divisions,}){
    _id = id;
    _name = name;
    _alias = alias;
    _divisions = divisions;
}

  Conferences.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
    if (json['divisions'] != null) {
      _divisions = [];
      json['divisions'].forEach((v) {
        _divisions?.add(Divisions.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _alias;
  List<Divisions>? _divisions;
Conferences copyWith({  String? id,
  String? name,
  String? alias,
  List<Divisions>? divisions,
}) => Conferences(  id: id ?? _id,
  name: name ?? _name,
  alias: alias ?? _alias,
  divisions: divisions ?? _divisions,
);
  String? get id => _id;
  String? get name => _name;
  String? get alias => _alias;
  List<Divisions>? get divisions => _divisions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    if (_divisions != null) {
      map['divisions'] = _divisions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "324decdd-aa1b-4074-8958-c009d8fac31a"
/// name : "AFC West"
/// alias : "AFC_WEST"
/// teams : [{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418","venue":{"id":"6589e61d-ef1e-4e30-91b5-9acd2072b8a0","name":"Empower Field at Mile High","city":"Denver","state":"CO","country":"USA","zip":"80204","address":"1701 Mile High Stadium Circle","capacity":76125,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8179","location":{"lat":"39.743865","lng":"-105.020158"}},"franchise":{"id":"32e2db10-be6d-41ed-9e3d-5b30ba164b99","name":"Broncos","alias":"DEN"},"team_colors":[{"type":"secondary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]},{"id":"1f6dcffb-9823-43cd-9ff4-e7a8466749b5","name":"Chargers","market":"Los Angeles","alias":"LAC","sr_id":"sr:competitor:4429","venue":{"id":"790c1f04-73c6-4f6f-8b1e-78a62260be90","name":"SoFi Stadium","city":"Inglewood","state":"CA","country":"USA","zip":"90301","address":"1000 S Prairie Ave","capacity":70240,"surface":"artificial","roof_type":"outdoor","sr_id":"sr:venue:52183","location":{"lat":"33.953536","lng":"-118.338734"}},"franchise":{"id":"a74d513a-dd7f-440d-a366-249f8f8dd97d","name":"Chargers","alias":"LAC"},"team_colors":[{"type":"primary","hex_color":"#002a5e","alpha":0,"rgb_color":{"red":0,"green":42,"blue":94}},{"type":"secondary","hex_color":"#ffc20e","alpha":0,"rgb_color":{"red":255,"green":194,"blue":14}}]},{"id":"6680d28d-d4d2-49f6-aace-5292d3ec02c2","name":"Chiefs","market":"Kansas City","alias":"KC","sr_id":"sr:competitor:4422","venue":{"id":"2ec4c411-dac2-403d-b091-6b6aa4a0a914","name":"GEHA Field at Arrowhead Stadium","city":"Kansas City","state":"MO","country":"USA","zip":"64129","address":"One Arrowhead Drive","capacity":76416,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8189","location":{"lat":"39.049019","lng":"-94.484140"}},"franchise":{"id":"5d239f9e-ef6a-46a6-83c2-94500fd119be","name":"Chiefs","alias":"KC"},"team_colors":[{"type":"secondary","hex_color":"#ffb81c","alpha":0,"rgb_color":{"red":255,"green":184,"blue":28}},{"type":"primary","hex_color":"#e31837","alpha":0,"rgb_color":{"red":227,"green":24,"blue":55}}]},{"id":"7d4fcc64-9cb5-4d1b-8e75-8a906d1e1576","name":"Raiders","market":"Las Vegas","alias":"LV","sr_id":"sr:competitor:4390","venue":{"id":"53d42601-5dfb-40a7-bd94-da2c1d3a75e4","name":"Allegiant Stadium","city":"Las Vegas","state":"NV","country":"USA","zip":"89118","address":"3333 Al Davis Way","capacity":65000,"surface":"turf","roof_type":"dome","sr_id":"sr:venue:51543","location":{"lat":"36.090852","lng":"-115.183339"}},"franchise":{"id":"859f427c-5157-4b5a-90e4-066e83f46cc3","name":"Raiders","alias":"LV"}}]

Divisions divisionsFromJson(String str) => Divisions.fromJson(json.decode(str));
String divisionsToJson(Divisions data) => json.encode(data.toJson());
class Divisions {
  Divisions({
      String? id, 
      String? name, 
      String? alias, 
      List<Teams>? teams,}){
    _id = id;
    _name = name;
    _alias = alias;
    _teams = teams;
}

  Divisions.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
    if (json['teams'] != null) {
      _teams = [];
      json['teams'].forEach((v) {
        _teams?.add(Teams.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _alias;
  List<Teams>? _teams;
Divisions copyWith({  String? id,
  String? name,
  String? alias,
  List<Teams>? teams,
}) => Divisions(  id: id ?? _id,
  name: name ?? _name,
  alias: alias ?? _alias,
  teams: teams ?? _teams,
);
  String? get id => _id;
  String? get name => _name;
  String? get alias => _alias;
  List<Teams>? get teams => _teams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    if (_teams != null) {
      map['teams'] = _teams?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "ce92bd47-93d5-4fe9-ada4-0fc681e6caa0"
/// name : "Broncos"
/// market : "Denver"
/// alias : "DEN"
/// sr_id : "sr:competitor:4418"
/// venue : {"id":"6589e61d-ef1e-4e30-91b5-9acd2072b8a0","name":"Empower Field at Mile High","city":"Denver","state":"CO","country":"USA","zip":"80204","address":"1701 Mile High Stadium Circle","capacity":76125,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8179","location":{"lat":"39.743865","lng":"-105.020158"}}
/// franchise : {"id":"32e2db10-be6d-41ed-9e3d-5b30ba164b99","name":"Broncos","alias":"DEN"}
/// team_colors : [{"type":"secondary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]

List<Teams> teamsListFromJson(String str) =>
    List<Teams>.from(json.decode(str).map((x) => Teams.fromJson(x)));

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));
String teamsToJson(Teams data) => json.encode(data.toJson());
class Teams {
  Teams({
      String? id, 
      String? name, 
      String? market, 
      String? alias, 
      String? srId, 
      Venue? venue, 
      Franchise? franchise, 
      List<TeamColors>? teamColors,}){
    _id = id;
    _name = name;
    _market = market;
    _alias = alias;
    _srId = srId;
    _venue = venue;
    _franchise = franchise;
    _teamColors = teamColors;
}

  Teams.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _market = json['market'];
    _alias = json['alias'];
    _srId = json['sr_id'];
    _venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
    if (json['team_colors'] != null) {
      _teamColors = [];
      json['team_colors'].forEach((v) {
        _teamColors?.add(TeamColors.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _market;
  String? _alias;
  String? _srId;
  Venue? _venue;
  Franchise? _franchise;
  List<TeamColors>? _teamColors;
Teams copyWith({  String? id,
  String? name,
  String? market,
  String? alias,
  String? srId,
  Venue? venue,
  Franchise? franchise,
  List<TeamColors>? teamColors,
}) => Teams(  id: id ?? _id,
  name: name ?? _name,
  market: market ?? _market,
  alias: alias ?? _alias,
  srId: srId ?? _srId,
  venue: venue ?? _venue,
  franchise: franchise ?? _franchise,
  teamColors: teamColors ?? _teamColors,
);
  String? get id => _id;
  String? get name => _name;
  String? get market => _market;
  String? get alias => _alias;
  String? get srId => _srId;
  Venue? get venue => _venue;
  Franchise? get franchise => _franchise;
  List<TeamColors>? get teamColors => _teamColors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['market'] = _market;
    map['alias'] = _alias;
    map['sr_id'] = _srId;
    if (_venue != null) {
      map['venue'] = _venue?.toJson();
    }
    if (_franchise != null) {
      map['franchise'] = _franchise?.toJson();
    }
    if (_teamColors != null) {
      map['team_colors'] = _teamColors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// type : "secondary"
/// hex_color : "#002244"
/// alpha : 0
/// rgb_color : {"red":0,"green":34,"blue":68}

TeamColors teamColorsFromJson(String str) => TeamColors.fromJson(json.decode(str));
String teamColorsToJson(TeamColors data) => json.encode(data.toJson());
class TeamColors {
  TeamColors({
      String? type, 
      String? hexColor, 
      int? alpha, 
      RgbColor? rgbColor,}){
    _type = type;
    _hexColor = hexColor;
    _alpha = alpha;
    _rgbColor = rgbColor;
}

  TeamColors.fromJson(dynamic json) {
    _type = json['type'];
    _hexColor = json['hex_color'];
    _alpha = json['alpha'];
    _rgbColor = json['rgb_color'] != null ? RgbColor.fromJson(json['rgb_color']) : null;
  }
  String? _type;
  String? _hexColor;
  int? _alpha;
  RgbColor? _rgbColor;
TeamColors copyWith({  String? type,
  String? hexColor,
  int? alpha,
  RgbColor? rgbColor,
}) => TeamColors(  type: type ?? _type,
  hexColor: hexColor ?? _hexColor,
  alpha: alpha ?? _alpha,
  rgbColor: rgbColor ?? _rgbColor,
);
  String? get type => _type;
  String? get hexColor => _hexColor;
  int? get alpha => _alpha;
  RgbColor? get rgbColor => _rgbColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['hex_color'] = _hexColor;
    map['alpha'] = _alpha;
    if (_rgbColor != null) {
      map['rgb_color'] = _rgbColor?.toJson();
    }
    return map;
  }

}

/// red : 0
/// green : 34
/// blue : 68

RgbColor rgbColorFromJson(String str) => RgbColor.fromJson(json.decode(str));
String rgbColorToJson(RgbColor data) => json.encode(data.toJson());
class RgbColor {
  RgbColor({
      int? red, 
      int? green, 
      int? blue,}){
    _red = red;
    _green = green;
    _blue = blue;
}

  RgbColor.fromJson(dynamic json) {
    _red = json['red'];
    _green = json['green'];
    _blue = json['blue'];
  }
  int? _red;
  int? _green;
  int? _blue;
RgbColor copyWith({  int? red,
  int? green,
  int? blue,
}) => RgbColor(  red: red ?? _red,
  green: green ?? _green,
  blue: blue ?? _blue,
);
  int? get red => _red;
  int? get green => _green;
  int? get blue => _blue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['red'] = _red;
    map['green'] = _green;
    map['blue'] = _blue;
    return map;
  }

}

/// id : "32e2db10-be6d-41ed-9e3d-5b30ba164b99"
/// name : "Broncos"
/// alias : "DEN"

Franchise franchiseFromJson(String str) => Franchise.fromJson(json.decode(str));
String franchiseToJson(Franchise data) => json.encode(data.toJson());
class Franchise {
  Franchise({
      String? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  Franchise.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
  }
  String? _id;
  String? _name;
  String? _alias;
Franchise copyWith({  String? id,
  String? name,
  String? alias,
}) => Franchise(  id: id ?? _id,
  name: name ?? _name,
  alias: alias ?? _alias,
);
  String? get id => _id;
  String? get name => _name;
  String? get alias => _alias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    return map;
  }

}

/// id : "6589e61d-ef1e-4e30-91b5-9acd2072b8a0"
/// name : "Empower Field at Mile High"
/// city : "Denver"
/// state : "CO"
/// country : "USA"
/// zip : "80204"
/// address : "1701 Mile High Stadium Circle"
/// capacity : 76125
/// surface : "turf"
/// roof_type : "outdoor"
/// sr_id : "sr:venue:8179"
/// location : {"lat":"39.743865","lng":"-105.020158"}

Venue venueFromJson(String str) => Venue.fromJson(json.decode(str));
String venueToJson(Venue data) => json.encode(data.toJson());
class Venue {
  Venue({
      String? id, 
      String? name, 
      String? city, 
      String? state, 
      String? country, 
      String? zip, 
      String? address, 
      int? capacity, 
      String? surface, 
      String? roofType, 
      String? srId, 
      Location? location,}){
    _id = id;
    _name = name;
    _city = city;
    _state = state;
    _country = country;
    _zip = zip;
    _address = address;
    _capacity = capacity;
    _surface = surface;
    _roofType = roofType;
    _srId = srId;
    _location = location;
}

  Venue.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _zip = json['zip'];
    _address = json['address'];
    _capacity = json['capacity'];
    _surface = json['surface'];
    _roofType = json['roof_type'];
    _srId = json['sr_id'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  String? _id;
  String? _name;
  String? _city;
  String? _state;
  String? _country;
  String? _zip;
  String? _address;
  int? _capacity;
  String? _surface;
  String? _roofType;
  String? _srId;
  Location? _location;
Venue copyWith({  String? id,
  String? name,
  String? city,
  String? state,
  String? country,
  String? zip,
  String? address,
  int? capacity,
  String? surface,
  String? roofType,
  String? srId,
  Location? location,
}) => Venue(  id: id ?? _id,
  name: name ?? _name,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  zip: zip ?? _zip,
  address: address ?? _address,
  capacity: capacity ?? _capacity,
  surface: surface ?? _surface,
  roofType: roofType ?? _roofType,
  srId: srId ?? _srId,
  location: location ?? _location,
);
  String? get id => _id;
  String? get name => _name;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get zip => _zip;
  String? get address => _address;
  int? get capacity => _capacity;
  String? get surface => _surface;
  String? get roofType => _roofType;
  String? get srId => _srId;
  Location? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['zip'] = _zip;
    map['address'] = _address;
    map['capacity'] = _capacity;
    map['surface'] = _surface;
    map['roof_type'] = _roofType;
    map['sr_id'] = _srId;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}

/// lat : "39.743865"
/// lng : "-105.020158"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? lat, 
      String? lng,}){
    _lat = lat;
    _lng = lng;
}

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }
  String? _lat;
  String? _lng;
Location copyWith({  String? lat,
  String? lng,
}) => Location(  lat: lat ?? _lat,
  lng: lng ?? _lng,
);
  String? get lat => _lat;
  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }

}

/// id : "3c6d318a-6164-4290-9bbc-bf9bb21cc4b8"
/// name : "National Football League"
/// alias : "NFL"

League leagueFromJson(String str) => League.fromJson(json.decode(str));
String leagueToJson(League data) => json.encode(data.toJson());
class League {
  League({
      String? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  League.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
  }
  String? _id;
  String? _name;
  String? _alias;
League copyWith({  String? id,
  String? name,
  String? alias,
}) => League(  id: id ?? _id,
  name: name ?? _name,
  alias: alias ?? _alias,
);
  String? get id => _id;
  String? get name => _name;
  String? get alias => _alias;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['alias'] = _alias;
    return map;
  }

}