import 'dart:convert';
/// id : "ce92bd47-93d5-4fe9-ada4-0fc681e6caa0"
/// name : "Broncos"
/// market : "Denver"
/// alias : "DEN"
/// sr_id : "sr:competitor:4418"
/// franchise : {"id":"32e2db10-be6d-41ed-9e3d-5b30ba164b99","name":"Broncos","alias":"DEN"}
/// venue : {"id":"6589e61d-ef1e-4e30-91b5-9acd2072b8a0","name":"Empower Field at Mile High","city":"Denver","state":"CO","country":"USA","zip":"80204","address":"1701 Mile High Stadium Circle","capacity":76125,"surface":"turf","roof_type":"outdoor","sr_id":"sr:venue:8179","location":{"lat":"39.743865","lng":"-105.020158"}}
/// division : {"id":"324decdd-aa1b-4074-8958-c009d8fac31a","name":"AFC West","alias":"AFC_WEST"}
/// conference : {"id":"1bdefe12-6cb2-4d6a-b208-b04602ae79c3","name":"AFC","alias":"AFC"}
/// coaches : [{"id":"51ba5ef6-cab8-4815-9333-06f598746486","full_name":"Nathaniel Hackett","first_name":"Nathaniel","last_name":"Hackett","position":"Head Coach"},{"id":"64bcf370-8444-11ec-93bf-ef26275bd8a5","full_name":"Justin Outten","first_name":"Justin","last_name":"Outten","position":"Offensive Coordinator"},{"id":"9fa89710-8457-11ec-9fca-7d45837dac31","full_name":"Ejiro Evero","first_name":"Ejiro","last_name":"Evero","position":"Defensive Coordinator"}]
/// team_colors : [{"type":"secondary","hex_color":"#002244","alpha":0,"rgb_color":{"red":0,"green":34,"blue":68}},{"type":"primary","hex_color":"#fb4f14","alpha":0,"rgb_color":{"red":251,"green":79,"blue":20}}]
/// players : [{"id":"030f3ecf-f32f-497d-96a8-8f28d44fc311","name":"Travis Fulgham","jersey":"15","last_name":"Fulgham","first_name":"Travis","abbr_name":"T.Fulgham","preferred_name":"Travis","birth_date":"1995-09-13","weight":215,"height":74,"position":"WR","birth_place":"Ashburn, VA, USA","high_school":"Broad Run (VA)","college":"Old Dominion","college_conf":"Conference USA","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1220002","draft":{"year":2019,"round":6,"number":184,"team":{"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419"}}},{"id":"04d09b84-6c99-4d99-a1f0-c30d3360ab52","name":"Jacob Bobenmoyer","jersey":"46","last_name":"Bobenmoyer","first_name":"Jacob","abbr_name":"J.Bobenmoyer","preferred_name":"Jacob","birth_date":"1997-05-28","weight":235,"height":74,"position":"LS","birth_place":"Cheyenne, WY, USA","high_school":"Cheyenne East (WY)","college":"Northern Colorado","college_conf":"Big Sky Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1226840"},{"id":"0830e644-2d6e-446b-9da6-57d7e3472fcd","name":"Kendall Hinton","jersey":"9","last_name":"Hinton","first_name":"Kendall","abbr_name":"K.Hinton","preferred_name":"Kendall","birth_date":"1997-02-19","weight":195,"height":72,"position":"WR","birth_place":"Durham, NC, USA","high_school":"Southern Durham (NC)","college":"Wake Forest","college_conf":"Atlantic Coast Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040533"},{"id":"0864f928-283f-40e4-9c04-f2b2b374e237","name":"Casey Tucker","jersey":"74","last_name":"Tucker","first_name":"Casey","abbr_name":"C.Tucker","preferred_name":"Casey","birth_date":"1995-09-26","weight":315,"height":78,"position":"T","birth_place":"Chandler, AZ, USA","high_school":"Hamilton (AZ)","college":"Arizona State","college_conf":"Pacific Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1196434"},{"id":"09fab9a8-b0af-4580-bf55-5c9167912f89","name":"Garett Bolles","jersey":"72","last_name":"Bolles","first_name":"Garett","abbr_name":"G.Bolles","preferred_name":"Garett","birth_date":"1992-05-27","weight":300,"height":77,"position":"T","birth_place":"Walnut Creek, CA, USA","high_school":"Westlake (CA)","college":"Utah","college_conf":"Pacific Twelve Conference","rookie_year":2017,"status":"ACT","sr_id":"sr:player:1129515","draft":{"year":2017,"round":1,"number":20,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"0f8ccece-d663-4069-944b-f318f64c60b7","name":"Melvin Gordon III","jersey":"25","last_name":"Gordon","first_name":"Melvin","abbr_name":"M.Gordon","preferred_name":"Melvin","birth_date":"1993-04-13","weight":215,"height":73,"position":"RB","birth_place":"Kenosha, WI, USA","high_school":"Bradford (WI)","college":"Wisconsin","college_conf":"Big Ten Conference","rookie_year":2015,"status":"ACT","sr_id":"sr:player:834519","name_suffix":"III","draft":{"year":2015,"round":1,"number":15,"team":{"id":"9dbb9060-ba0f-4920-829e-16d4d9246b5d","name":"Chargers","market":"San Diego","alias":"SD"}}},{"id":"155980c2-e289-48c4-a047-09c08d0ce7ae","name":"P.J. Locke","jersey":"37","last_name":"Locke","first_name":"P.J.","abbr_name":"P.Locke","preferred_name":"P.J.","birth_date":"1997-02-12","weight":202,"height":70,"position":"SAF","birth_place":"Beaumont, TX, USA","high_school":"Central (TX)","college":"Texas","college_conf":"Big Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1227106"},{"id":"16423bd0-6239-454c-9ec8-f90477de17b1","name":"Quinn Bailey","jersey":"75","last_name":"Bailey","first_name":"Quinn","abbr_name":"Q.Bailey","preferred_name":"Quinn","birth_date":"1995-10-18","weight":323,"height":78,"position":"T","birth_place":"Gilbert, AZ, USA","high_school":"Higley (AZ)","college":"Arizona State","college_conf":"Pacific Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1220812"},{"id":"1c1f0577-f9c7-4406-b2ab-b9e42ddb1af3","name":"Tom Compton","jersey":"69","last_name":"Compton","first_name":"Tom","abbr_name":"T.Compton","preferred_name":"Tom","birth_date":"1989-05-10","weight":308,"height":77,"position":"T","birth_place":"Rosemount, MN, USA","high_school":"Rosemount (MN)","college":"South Dakota","college_conf":"Great West Football Conference","rookie_year":2012,"status":"ACT","sr_id":"sr:player:829031","draft":{"year":2012,"round":6,"number":193,"team":{"id":"22052ff7-c065-42ee-bc8f-c4691c50e624","name":"Commanders","market":"Washington","alias":"WAS","sr_id":"sr:competitor:4432"}}},{"id":"22476480-d255-11ec-b16e-cf7159baf83d","name":"Kadofi Wright","jersey":"48","last_name":"Wright","first_name":"Kadofi","abbr_name":"K.Wright","preferred_name":"Kadofi","weight":230,"height":75,"position":"MLB","birth_place":"Richmond, VA, USA","high_school":"Henrico (VA)","college":"Buffalo","college_conf":"Mid-American Conference","status":"ACT","sr_id":"sr:player:1193626"},{"id":"22b2030e-ec57-4f96-b722-57b3e495c83d","name":"Graham Glasgow","jersey":"61","last_name":"Glasgow","first_name":"Graham","abbr_name":"G.Glasgow","preferred_name":"Graham","birth_date":"1992-07-19","weight":310,"height":78,"position":"G","birth_place":"Aurora, IL, USA","high_school":"Marmion Academy (IL)","college":"Michigan","college_conf":"Big Ten Conference","rookie_year":2016,"status":"ACT","sr_id":"sr:player:1073950","draft":{"year":2016,"round":3,"number":95,"team":{"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419"}}},{"id":"291aca07-a3b7-4666-a8c0-2e0c01024de5","name":"Mike Purcell","jersey":"98","last_name":"Purcell","first_name":"Mike","abbr_name":"M.Purcell","preferred_name":"Mike","birth_date":"1991-04-20","weight":328,"height":75,"position":"NT","birth_place":"Highlands Ranch, CO, USA","high_school":"Highlands Ranch (CO)","college":"Wyoming","college_conf":"Mountain West Conference","rookie_year":2013,"status":"ACT","sr_id":"sr:player:827551"},{"id":"29815a83-1d6b-4e1b-b1c6-9bf44e7166c9","name":"Jonathan Harris","jersey":"92","last_name":"Harris","first_name":"Jonathan","abbr_name":"J.Harris","preferred_name":"Jonathan","birth_date":"1996-08-04","weight":295,"height":77,"position":"DT","birth_place":"Aurora, IL, USA","high_school":"Waubonsie Valley (IL)","college":"Lindenwood","college_conf":"Mid-America Intercollegiate Athletic Association","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1737967"},{"id":"2a443351-5e63-4a49-819e-912b51a745f2","name":"Tim Patrick","jersey":"81","last_name":"Patrick","first_name":"Tim","abbr_name":"T.Patrick","preferred_name":"Tim","birth_date":"1993-11-23","weight":212,"height":76,"position":"WR","birth_place":"San Diego, CA, USA","high_school":"University City (CA)","college":"Utah","college_conf":"Pacific Twelve Conference","rookie_year":2017,"status":"ACT","sr_id":"sr:player:1130503"},{"id":"2a77de20-d253-11ec-b16e-cf7159baf83d","name":"Tyreik McAllister","jersey":"39","last_name":"McAllister","first_name":"Tyreik","abbr_name":"T.McAllister","preferred_name":"Tyreik","weight":180,"height":71,"position":"RB","birth_place":"Latta, SC, USA","high_school":"Latta (SC)","college":"Charleston","college_conf":"Mountain East Conference","status":"ACT","sr_id":"sr:player:2350673"},{"id":"2afbb0f0-d24f-11ec-b16e-cf7159baf83d","name":"Christopher Allen","jersey":"45","last_name":"Allen","first_name":"Christopher","abbr_name":"C.Allen","preferred_name":"Christopher","weight":242,"height":76,"position":"OLB","birth_place":"Baton Rouge, LA, USA","high_school":"Southern Lab School (LA)","college":"Alabama","college_conf":"Southeastern Conference","status":"ACT","sr_id":"sr:player:1235410"},{"id":"2c426f80-d254-11ec-b16e-cf7159baf83d","name":"Michael Niese","jersey":"67","last_name":"Niese","first_name":"Michael","abbr_name":"M.Niese","preferred_name":"Michael","weight":295,"height":77,"position":"G","birth_place":"Chesterfield, MO, USA","high_school":"St. Louis University (MO)","college":"Temple","college_conf":"American Athletic Conference","status":"ACT","sr_id":"sr:player:1183960"},{"id":"2df474e5-7117-4650-8d53-34b3fd0f1bbb","name":"Justin Simmons","jersey":"31","last_name":"Simmons","first_name":"Justin","abbr_name":"J.Simmons","preferred_name":"Justin","birth_date":"1993-11-19","weight":202,"height":74,"position":"SAF","birth_place":"Manassas, VA, USA","high_school":"Martin County (FL)","college":"Boston College","college_conf":"Atlantic Coast Conference","rookie_year":2016,"status":"ACT","sr_id":"sr:player:987677","draft":{"year":2016,"round":3,"number":98,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"32b2d6f6-a636-4d73-927c-361c1aa809f5","name":"Corliss Waitman","jersey":"17","last_name":"Waitman","first_name":"Corliss","abbr_name":"C.Waitman","preferred_name":"Corliss","birth_date":"1995-07-21","weight":210,"height":74,"position":"P","birth_place":"Milton, FL, USA","high_school":"Milton (FL)","college":"South Alabama","college_conf":"Sun Belt Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1192416"},{"id":"34853ce3-5e1f-4b23-b730-6f51444291ac","name":"Essang Bassey","jersey":"34","last_name":"Bassey","first_name":"Essang","abbr_name":"E.Bassey","preferred_name":"Essang","birth_date":"1998-08-12","weight":190,"height":70,"position":"CB","birth_place":"Columbus, GA, USA","high_school":"Columbus (GA)","college":"Wake Forest","college_conf":"Atlantic Coast Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040231"},{"id":"35341f6c-bca9-427b-a8eb-f9a24a334184","name":"Trey Quinn","jersey":"84","last_name":"Quinn","first_name":"Trey","abbr_name":"T.Quinn","preferred_name":"Trey","birth_date":"1995-12-07","weight":200,"height":72,"position":"WR","birth_place":"Lake Charles, LA, USA","high_school":"Barbe (LA)","college":"SMU","college_conf":"American Athletic Conference","rookie_year":2018,"status":"ACT","sr_id":"sr:player:1209146","draft":{"year":2018,"round":7,"number":256,"team":{"id":"22052ff7-c065-42ee-bc8f-c4691c50e624","name":"Commanders","market":"Washington","alias":"WAS","sr_id":"sr:competitor:4432"}}},{"id":"38d9a47a-c3e3-4355-9995-c12782832728","name":"Matt Henningsen","jersey":"91","last_name":"Henningsen","first_name":"Matt","abbr_name":"M.Henningsen","birth_date":"1999-05-01","weight":291,"height":75,"position":"DE","birth_place":"Menomonee Falls, WI, USA","high_school":"Menomonee Falls (WI)","college":"Wisconsin","college_conf":"Big Ten Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1271128","draft":{"year":2022,"round":6,"number":206,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"409d4cac-ee90-4470-9710-ebe671678339","name":"Russell Wilson","jersey":"3","last_name":"Wilson","first_name":"Russell","abbr_name":"R.Wilson","preferred_name":"Russell","birth_date":"1988-11-29","weight":215,"height":71,"position":"QB","birth_place":"Richmond, VA, USA","high_school":"Collegiate (VA)","college":"Wisconsin","college_conf":"Big Ten Conference","rookie_year":2012,"status":"ACT","sr_id":"sr:player:831309","draft":{"year":2012,"round":3,"number":75,"team":{"id":"3d08af9e-c767-4f88-a7dc-b920c6d2b4a8","name":"Seahawks","market":"Seattle","alias":"SEA","sr_id":"sr:competitor:4430"}}},{"id":"440bf3a1-d373-4f11-b702-26fb8f62c035","name":"Marquiss Spencer","jersey":"51","last_name":"Spencer","first_name":"Marquiss","abbr_name":"M.Spencer","preferred_name":"Marquiss","birth_date":"1997-07-16","weight":295,"height":76,"position":"DE","birth_place":"Greenwood, MS, USA","high_school":"Greenwood (MS)","college":"Mississippi State","college_conf":"Southeastern Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2198130","draft":{"year":2021,"round":7,"number":253,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"4c577f09-a082-43f8-b249-c821350302dc","name":"J.R. Reed","jersey":"20","last_name":"Reed","first_name":"J.R.","abbr_name":"J.Reed","preferred_name":"J.R.","birth_date":"1996-03-11","weight":194,"height":73,"position":"SAF","birth_place":"Frisco, TX, USA","high_school":"Prestonwood Christian (TX)","college":"Georgia","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1200268"},{"id":"50b60c54-3f6b-49dd-b1e0-2f8c6193b606","name":"Luke Wattenberg","jersey":"60","last_name":"Wattenberg","first_name":"Luke","abbr_name":"L.Wattenberg","birth_date":"1997-09-10","weight":295,"height":77,"position":"C","birth_place":"Trabuco Canyon, CA, USA","high_school":"JSerra Catholic (CA)","college":"Washington","college_conf":"Pacific Twelve Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1228482","draft":{"year":2022,"round":5,"number":171,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"5180ecc5-bbd9-42b6-b227-c5efdb53cf80","name":"Jonas Griffith","jersey":"50","last_name":"Griffith","first_name":"Jonas","abbr_name":"J.Griffith","preferred_name":"Jonas","birth_date":"1997-01-27","weight":250,"height":76,"position":"LB","birth_place":"Louisville, KY, USA","high_school":"Academy at Shawnee (KY)","college":"Indiana State","college_conf":"Missouri Valley Football Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1211982"},{"id":"570c17a4-c14a-45a0-afda-93ef879b2604","name":"Dalton Risner","jersey":"66","last_name":"Risner","first_name":"Dalton","abbr_name":"D.Risner","preferred_name":"Dalton","birth_date":"1995-07-13","weight":312,"height":77,"position":"G","birth_place":"Branson, MO, USA","high_school":"Wiggins (CO)","college":"Kansas State","college_conf":"Big Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1227946","draft":{"year":2019,"round":2,"number":41,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"57df194b-d445-4e66-af51-7b781b0f529f","name":"Bless Austin","jersey":"38","last_name":"Austin","first_name":"Bless","abbr_name":"B.Austin","preferred_name":"Bless","birth_date":"1996-07-19","weight":198,"height":73,"position":"DB","birth_place":"Queens, NY, USA","high_school":"Campus Magnet (NY)","college":"Rutgers","college_conf":"Big Ten Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1225482","draft":{"year":2019,"round":6,"number":196,"team":{"id":"5fee86ae-74ab-4bdd-8416-42a9dd9964f3","name":"Jets","market":"New York","alias":"NYJ","sr_id":"sr:competitor:4427"}}},{"id":"582dc00e-e7ec-4ca7-bff0-f7b1d604017b","name":"Eric Saubert","jersey":"82","last_name":"Saubert","first_name":"Eric","abbr_name":"E.Saubert","preferred_name":"Eric","birth_date":"1994-05-01","weight":253,"height":77,"position":"TE","birth_place":"Chicago, IL, USA","high_school":"Hoffman Estates (IL)","college":"Drake","college_conf":"Pioneer Football League","rookie_year":2017,"status":"ACT","sr_id":"sr:player:1130245","draft":{"year":2017,"round":5,"number":174,"team":{"id":"e6aa13a4-0055-48a9-bc41-be28dc106929","name":"Falcons","market":"Atlanta","alias":"ATL","sr_id":"sr:competitor:4393"}}},{"id":"5c1cb09e-be4b-43e7-b35d-98db06cea707","name":"Caden Sterns","jersey":"30","last_name":"Sterns","first_name":"Caden","abbr_name":"C.Sterns","preferred_name":"Caden","birth_date":"1999-11-02","weight":207,"height":73,"position":"SAF","birth_place":"Cibolo, TX, USA","high_school":"Byron P. Steele II (TX)","college":"Texas","college_conf":"Big Twelve Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2198138","draft":{"year":2021,"round":5,"number":152,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"5c753156-6ba2-4e25-9fbd-492c69e06ff0","name":"Pat Surtain II","jersey":"2","last_name":"Surtain","first_name":"Pat","abbr_name":"P.Surtain","preferred_name":"Pat","birth_date":"2000-04-14","weight":202,"height":74,"position":"CB","birth_place":"Plantation, FL, USA","high_school":"American Heritage (FL)","college":"Alabama","college_conf":"Southeastern Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2197908","name_suffix":"II","draft":{"year":2021,"round":1,"number":9,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"5c913725-c52a-4633-b3b9-efa6a9d2cf05","name":"Randy Gregory","jersey":"5","last_name":"Gregory","first_name":"Randy","abbr_name":"R.Gregory","preferred_name":"Randy","birth_date":"1992-11-23","weight":255,"height":77,"position":"OLB","birth_place":"Fishers, IN, USA","high_school":"Hamilton Southeastern (IN)","college":"Nebraska","college_conf":"Big Ten Conference","rookie_year":2015,"status":"ACT","sr_id":"sr:player:834751","draft":{"year":2015,"round":2,"number":60,"team":{"id":"e627eec7-bbae-4fa4-8e73-8e1d6bc5c060","name":"Cowboys","market":"Dallas","alias":"DAL","sr_id":"sr:competitor:4392"}}},{"id":"617aee8a-70be-4bdf-9a71-2e2b74e647e6","name":"Albert Okwuegbunam","jersey":"85","last_name":"Okwuegbunam","first_name":"Albert","abbr_name":"A.Okwuegbunam","preferred_name":"Albert","birth_date":"1998-04-25","weight":258,"height":77,"position":"TE","birth_place":"Springfield, IL, USA","high_school":"Sacred Heart Griffin (IL)","college":"Missouri","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040279","draft":{"year":2020,"round":4,"number":118,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"626d2a50-d254-11ec-b16e-cf7159baf83d","name":"Dylan Parham","jersey":"48","last_name":"Parham","first_name":"Dylan","abbr_name":"D.Parham","preferred_name":"Dylan","weight":245,"height":77,"position":"TE","birth_place":"Raleigh, NC, USA","high_school":"Southeast (NC)","college":"North Carolina State","college_conf":"Atlantic Coast Conference","status":"ACT","sr_id":"sr:player:1196812"},{"id":"62fb07e0-d253-11ec-b16e-cf7159baf83d","name":"Ja'Quan McMillian","jersey":"35","last_name":"McMillian","first_name":"Ja'Quan","abbr_name":"J.McMillian","preferred_name":"Ja'Quan","weight":183,"height":70,"position":"CB","birth_place":"Winston-Salem, NC, USA","high_school":"West Forsyth (NC)","college":"East Carolina","college_conf":"American Athletic Conference","status":"ACT","sr_id":"sr:player:1707731"},{"id":"63a656b9-bcbb-44a3-95c8-e8a63660e71b","name":"K'Waun Williams","jersey":"21","last_name":"Williams","first_name":"K'Waun","abbr_name":"K.Williams","preferred_name":"K'Waun","birth_date":"1991-07-12","weight":183,"height":69,"position":"CB","birth_place":"Paterson, NJ, USA","high_school":"St. Joseph Regional (NJ)","college":"Pittsburgh","college_conf":"Atlantic Coast Conference","rookie_year":2014,"status":"ACT","sr_id":"sr:player:828033"},{"id":"64321852-52e3-4ac0-9b3e-898f0b1e500c","name":"Netane Muti","jersey":"52","last_name":"Muti","first_name":"Netane","abbr_name":"N.Muti","preferred_name":"Netane","birth_date":"1999-03-27","weight":315,"height":75,"position":"G","birth_place":"Wahiawa, HI, USA","high_school":"Leilehua (HI)","college":"Fresno State","college_conf":"Mountain West Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040627","draft":{"year":2020,"round":6,"number":181,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"6444feb1-f5a4-4b45-9a45-79308a4445fd","name":"Brandon McManus","jersey":"8","last_name":"McManus","first_name":"Brandon","abbr_name":"B.McManus","preferred_name":"Brandon","birth_date":"1991-07-25","weight":201,"height":75,"position":"K","birth_place":"Hatfield, PA, USA","high_school":"North Penn (PA)","college":"Temple","college_conf":"American Athletic Conference","rookie_year":2013,"status":"ACT","sr_id":"sr:player:830901"},{"id":"66313049-299d-4e58-beb9-8e051ab6548a","name":"Bradley Chubb","jersey":"55","last_name":"Chubb","first_name":"Bradley","abbr_name":"B.Chubb","preferred_name":"Bradley","birth_date":"1996-06-24","weight":275,"height":76,"position":"OLB","birth_place":"Marietta, GA, USA","high_school":"Hillgrove (GA)","college":"North Carolina State","college_conf":"Atlantic Coast Conference","rookie_year":2018,"status":"ACT","sr_id":"sr:player:1194362","draft":{"year":2018,"round":1,"number":5,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"67e5566c-73df-43b7-80ae-3d50d68ac189","name":"Calvin Anderson","jersey":"76","last_name":"Anderson","first_name":"Calvin","abbr_name":"C.Anderson","preferred_name":"Calvin","birth_date":"1996-03-25","weight":300,"height":77,"position":"T","birth_place":"Philadelphia, PA, USA","high_school":"Westlake (TX)","college":"Texas","college_conf":"Big Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1210510"},{"id":"73e133bf-d3f7-4fda-bd25-2fde66cb8ee1","name":"Josh Johnson","jersey":"11","last_name":"Johnson","first_name":"Josh","abbr_name":"J.Johnson","preferred_name":"Josh","birth_date":"1986-05-15","weight":201,"height":74,"position":"QB","birth_place":"Oakland, CA, USA","high_school":"Oakland Tech (CA)","college":"San Diego","college_conf":"Pioneer Football League","rookie_year":2008,"status":"ACT","sr_id":"sr:player:830825","draft":{"year":2008,"round":5,"number":160,"team":{"id":"4254d319-1bc7-4f81-b4ab-b5e6f3402b69","name":"Buccaneers","market":"Tampa Bay","alias":"TB","sr_id":"sr:competitor:4388"}}},{"id":"74ee9029-96c6-4a9b-bd20-1b2ba18c14b5","name":"Jonathon Cooper","jersey":"53","last_name":"Cooper","first_name":"Jonathon","abbr_name":"J.Cooper","preferred_name":"Jonathon","birth_date":"1998-01-08","weight":254,"height":75,"position":"OLB","birth_place":"Gahanna, OH, USA","high_school":"Lincoln (OH)","college":"Ohio State","college_conf":"Big Ten Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2198072","draft":{"year":2021,"round":7,"number":239,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"750877e5-ccdd-4072-9e1c-8d957e45b561","name":"Donnie Lewis Jr.","jersey":"39","last_name":"Lewis","first_name":"Donnie","abbr_name":"D.Lewis","preferred_name":"Donnie","birth_date":"1996-07-21","weight":195,"height":72,"position":"CB","birth_place":"Baton Rouge, LA, USA","high_school":"Central (LA)","college":"Tulane","college_conf":"American Athletic Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1833942","name_suffix":"Jr.","draft":{"year":2019,"round":7,"number":221,"team":{"id":"d5a2eb42-8065-4174-ab79-0a6fa820e35e","name":"Browns","market":"Cleveland","alias":"CLE","sr_id":"sr:competitor:4417"}}},{"id":"7788ca8f-88c8-447f-9110-3cfd3ca5efd8","name":"Billy Turner","jersey":"57","last_name":"Turner","first_name":"Billy","abbr_name":"B.Turner","preferred_name":"Billy","birth_date":"1991-10-17","weight":310,"height":77,"position":"OL","birth_place":"Shoreview, MN, USA","high_school":"Mounds View (MN)","college":"North Dakota State","college_conf":"Missouri Valley Football Conference","rookie_year":2014,"status":"ACT","sr_id":"sr:player:830963","draft":{"year":2014,"round":3,"number":67,"team":{"id":"4809ecb0-abd3-451d-9c4a-92a90b83ca06","name":"Dolphins","market":"Miami","alias":"MIA","sr_id":"sr:competitor:4287"}}},{"id":"784f8433-0379-46bc-b9ed-6c5a1783513d","name":"Nik Bonitto","jersey":"42","last_name":"Bonitto","first_name":"Nik","abbr_name":"N.Bonitto","birth_date":"1999-09-26","weight":240,"height":75,"position":"OLB","birth_place":"Fort Lauderdale, FL, USA","high_school":"St. Thomas Aquinas (FL)","college":"Oklahoma","college_conf":"Big Twelve Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1423123","draft":{"year":2022,"round":2,"number":64,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"7f35aa83-30f3-4997-b5de-11b0c19e90cb","name":"Malik Reed","jersey":"59","last_name":"Reed","first_name":"Malik","abbr_name":"M.Reed","preferred_name":"Malik","birth_date":"1996-08-05","weight":235,"height":74,"position":"OLB","birth_place":"Dothan, AL, USA","high_school":"Dothan (AL)","college":"Nevada","college_conf":"Mountain West Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1203726"},{"id":"802f0638-40c7-4e72-872e-fd3a12b479c5","name":"Faion Hicks","jersey":"29","last_name":"Hicks","first_name":"Faion","abbr_name":"F.Hicks","birth_date":"1997-09-17","weight":192,"height":70,"position":"CB","birth_place":"Miami, FL, USA","high_school":"Flanagan (FL)","college":"Wisconsin","college_conf":"Big Ten Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1233640","draft":{"year":2022,"round":7,"number":232,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"80422fa0-20c3-40d8-a3e6-93f55b09b872","name":"Zack Johnson","jersey":"68","last_name":"Johnson","first_name":"Zack","abbr_name":"Z.Johnson","preferred_name":"Zack","birth_date":"1993-11-14","weight":301,"height":78,"position":"G","birth_place":"Blaine, MN, USA","high_school":"Spring Lake Park (MN)","college":"North Dakota State","college_conf":"Missouri Valley Football Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1181440"},{"id":"80b403da-381f-467e-883b-5b83ac02aac3","name":"Sam Martin","jersey":"6","last_name":"Martin","first_name":"Sam","abbr_name":"S.Martin","preferred_name":"Sam","birth_date":"1990-02-27","weight":211,"height":73,"position":"P","birth_place":"Fayetteville, GA, USA","high_school":"Starr's Mill (GA)","college":"Appalachian State","college_conf":"Southern Conference","rookie_year":2013,"status":"ACT","sr_id":"sr:player:829069","draft":{"year":2013,"round":5,"number":165,"team":{"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419"}}},{"id":"8753f2f2-16df-41c8-b25d-c93ada64d78c","name":"Lloyd Cushenberry III","jersey":"79","last_name":"Cushenberry","first_name":"Lloyd","abbr_name":"L.Cushenberry","preferred_name":"Lloyd","birth_date":"1997-11-22","weight":312,"height":75,"position":"C","birth_place":"Carville, LA, USA","high_school":"Dutchtown (LA)","college":"LSU","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040539","name_suffix":"III","draft":{"year":2020,"round":3,"number":83,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"889dcdc5-3d88-45df-9677-5ad7ff87c011","name":"Javonte Williams","jersey":"33","last_name":"Williams","first_name":"Javonte","abbr_name":"J.Williams","preferred_name":"Javonte","birth_date":"2000-04-25","weight":220,"height":70,"position":"RB","birth_place":"Wallace, NC, USA","high_school":"Wallace-Rose Hill (NC)","college":"North Carolina","college_conf":"Atlantic Coast Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2197784","draft":{"year":2021,"round":2,"number":35,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"89338a12-65a8-4670-ac99-97281732ff79","name":"KJ Hamler","jersey":"1","last_name":"Hamler","first_name":"KJ","abbr_name":"K.Hamler","preferred_name":"KJ","birth_date":"1999-07-08","weight":178,"height":69,"position":"WR","birth_place":"Pontiac, MI, USA","high_school":"IMG Academy (FL)","college":"Penn State","college_conf":"Big Ten Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040193","draft":{"year":2020,"round":2,"number":46,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"8bd08ef6-5d55-4fd0-b7db-1489d88c6ebd","name":"Quinn Meinerz","jersey":"77","last_name":"Meinerz","first_name":"Quinn","abbr_name":"Q.Meinerz","preferred_name":"Quinn","birth_date":"1998-11-15","weight":320,"height":75,"position":"OL","birth_place":"Hartford, WI, USA","high_school":"Hartford Union (WI)","college":"Wisconsin-Whitewater","college_conf":"Wisconsin Intercollegiate Athletic Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2198032","draft":{"year":2021,"round":3,"number":98,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"8cd3d1bb-5b04-4351-bd03-4b4f9b9e33e4","name":"Tyrie Cleveland","jersey":"16","last_name":"Cleveland","first_name":"Tyrie","abbr_name":"T.Cleveland","preferred_name":"Tyrie","birth_date":"1997-09-20","weight":209,"height":74,"position":"WR","birth_place":"Houston, TX, USA","high_school":"Westfield (TX)","college":"Florida","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040375","draft":{"year":2020,"round":7,"number":252,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"90785e41-84ca-41b8-a7f8-47f20086275b","name":"Montrell Washington","jersey":"12","last_name":"Washington","first_name":"Montrell","abbr_name":"M.Washington","birth_date":"1999-03-14","weight":170,"height":70,"position":"WR","birth_place":"Canton, GA, USA","high_school":"Cherokee (GA)","college":"Samford","college_conf":"Southern Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1258386","draft":{"year":2022,"round":5,"number":162,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"92c8bc67-756d-4e3c-981c-3df010e15e2d","name":"Dre'Mont Jones","jersey":"93","last_name":"Jones","first_name":"Dre'Mont","abbr_name":"D.Jones","preferred_name":"Dre'Mont","birth_date":"1997-01-05","weight":281,"height":75,"position":"DE","birth_place":"Cleveland, OH, USA","high_school":"St. Ignatius (OH)","college":"Ohio State","college_conf":"Big Ten Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1217072","draft":{"year":2019,"round":3,"number":71,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"9424475a-fba7-4bfd-b79c-f372ad28082a","name":"Mike Boone","jersey":"26","last_name":"Boone","first_name":"Mike","abbr_name":"M.Boone","preferred_name":"Mike","birth_date":"1995-06-30","weight":205,"height":70,"position":"RB","birth_place":"Macclenny, FL, USA","high_school":"Baker County (FL)","college":"Cincinnati","college_conf":"American Athletic Conference","rookie_year":2018,"status":"ACT","sr_id":"sr:player:1194256"},{"id":"9492f51a-22eb-465f-b3bb-aaee81ce76f5","name":"DeShawn Williams","jersey":"99","last_name":"Williams","first_name":"DeShawn","abbr_name":"D.Williams","preferred_name":"DeShawn","birth_date":"1992-12-29","weight":292,"height":73,"position":"DT","birth_place":"Central, SC, USA","high_school":"D. W. Daniel (SC)","college":"Clemson","college_conf":"Atlantic Coast Conference","rookie_year":2015,"status":"ACT","sr_id":"sr:player:838015"},{"id":"954d9ed8-41ed-4222-b0d8-b3cc8d1755a5","name":"Alex Singleton","jersey":"49","last_name":"Singleton","first_name":"Alex","abbr_name":"A.Singleton","preferred_name":"Alex","birth_date":"1993-12-07","weight":235,"height":74,"position":"LB","birth_place":"Thousand Oaks, CA, USA","high_school":"Thousand Oaks (CA)","college":"Montana State","college_conf":"Big Sky Conference","rookie_year":2015,"status":"ACT","sr_id":"sr:player:836239"},{"id":"9a7a5d90-d250-11ec-b16e-cf7159baf83d","name":"Sebastian Gutierrez","jersey":"70","last_name":"Gutierrez","first_name":"Sebastian","abbr_name":"S.Gutierrez","preferred_name":"Sebastian","weight":295,"height":78,"position":"T","birth_place":"Pasco, WA, USA","high_school":"Pasco (WA)","college":"Minot State","college_conf":"Northern Sun Intercollegiate Conference","status":"ACT","sr_id":"sr:player:2350671"},{"id":"9ab44516-2a26-4049-b630-66539c7a5dfd","name":"Brett Rypien","jersey":"4","last_name":"Rypien","first_name":"Brett","abbr_name":"B.Rypien","preferred_name":"Brett","birth_date":"1996-07-09","weight":200,"height":74,"position":"QB","birth_place":"Spokane, WA, USA","high_school":"Shadle Park (WA)","college":"Boise State","college_conf":"Mountain West Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1206698"},{"id":"a2f1a595-4454-465e-a190-0312a2ea3acc","name":"Jamar Johnson","jersey":"41","last_name":"Johnson","first_name":"Jamar","abbr_name":"J.Johnson","preferred_name":"Jamar","birth_date":"1999-11-22","weight":197,"height":73,"position":"SAF","birth_place":"Sarasota, FL, USA","high_school":"Riverview (FL)","college":"Indiana","college_conf":"Big Ten Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2197954","draft":{"year":2021,"round":5,"number":164,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"a473e7a2-8f31-43ad-b87f-c39e6635f1b0","name":"Josey Jewell","jersey":"47","last_name":"Jewell","first_name":"Josey","abbr_name":"J.Jewell","preferred_name":"Josey","birth_date":"1994-12-25","weight":236,"height":73,"position":"LB","birth_place":"Decorah, IA, USA","high_school":"Decorah (IA)","college":"Iowa","college_conf":"Big Ten Conference","rookie_year":2018,"status":"ACT","sr_id":"sr:player:1220892","draft":{"year":2018,"round":4,"number":106,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"aa8d3730-d254-11ec-b16e-cf7159baf83d","name":"Jalen Virgil","jersey":"17","last_name":"Virgil","first_name":"Jalen","abbr_name":"J.Virgil","preferred_name":"Jalen","weight":210,"height":72,"position":"WR","birth_place":"Lawrenceville, GA, USA","high_school":"Mountain View (GA)","college":"Appalachian State","college_conf":"Sun Belt Conference","status":"ACT","sr_id":"sr:player:1217910"},{"id":"acb316b0-d24f-11ec-b16e-cf7159baf83d","name":"Kaden Davis","jersey":"13","last_name":"Davis","first_name":"Kaden","abbr_name":"K.Davis","preferred_name":"Kaden","weight":190,"height":73,"position":"WR","birth_place":"Ellsworth, KS, USA","high_school":"Ellsworth (KS)","college":"Northwest Missouri State","college_conf":"Mid-America Intercollegiate Athletics Association","status":"ACT","sr_id":"sr:player:2350675"},{"id":"b3d7169b-9cf6-4fea-815a-26e4fb0ec16a","name":"Eric Tomlinson","jersey":"87","last_name":"Tomlinson","first_name":"Eric","abbr_name":"E.Tomlinson","preferred_name":"Eric","birth_date":"1992-04-22","weight":263,"height":78,"position":"TE","birth_place":"Oklahoma City, OK, USA","high_school":"Klein (TX)","college":"UTEP","college_conf":"Conference USA","rookie_year":2015,"status":"ACT","sr_id":"sr:player:855784"},{"id":"b556a98d-16aa-4a0d-9134-1b59c46cc640","name":"Andrew Beck","jersey":"83","last_name":"Beck","first_name":"Andrew","abbr_name":"A.Beck","preferred_name":"Andrew","birth_date":"1996-05-15","weight":255,"height":75,"position":"FB","birth_place":"Tampa, FL, USA","high_school":"Plant (FL)","college":"Texas","college_conf":"Big Twelve Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1221308"},{"id":"b55ae5ba-593f-4560-9cab-14e10698e01d","name":"Courtland Sutton","jersey":"14","last_name":"Sutton","first_name":"Courtland","abbr_name":"C.Sutton","preferred_name":"Courtland","birth_date":"1995-10-10","weight":216,"height":76,"position":"WR","birth_place":"Brenham, TX, USA","high_school":"Brenham (TX)","college":"SMU","college_conf":"American Athletic Conference","rookie_year":2018,"status":"ACT","sr_id":"sr:player:1185936","draft":{"year":2018,"round":2,"number":40,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"b9e4a022-d15c-4cef-9879-170277f17207","name":"Greg Dulcich","jersey":"80","last_name":"Dulcich","first_name":"Greg","abbr_name":"G.Dulcich","birth_date":"2000-03-26","weight":245,"height":75,"position":"TE","birth_place":"Glendale, CA, USA","high_school":"Saint Francis (CA)","college":"UCLA","college_conf":"Pacific Twelve Conference","rookie_year":2022,"status":"ACT","sr_id":"sr:player:1555599","draft":{"year":2022,"round":3,"number":80,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"bc399631-6a3c-4515-9f8b-acc9a08bc434","name":"Michael Ojemudia","jersey":"13","last_name":"Ojemudia","first_name":"Michael","abbr_name":"M.Ojemudia","preferred_name":"Michael","birth_date":"1997-09-12","weight":200,"height":73,"position":"CB","birth_place":"Farmington Hills, MI, USA","high_school":"Harrison (MI)","college":"Iowa","college_conf":"Big Ten Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040017","draft":{"year":2020,"round":3,"number":77,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"c63eb787-fa1f-406b-82a1-2eed0a65b58c","name":"Ronald Darby","jersey":"23","last_name":"Darby","first_name":"Ronald","abbr_name":"R.Darby","preferred_name":"Ronald","birth_date":"1994-01-02","weight":193,"height":71,"position":"CB","birth_place":"Oxon Hill, MD, USA","high_school":"Potomac (MD)","college":"Florida State","college_conf":"Atlantic Coast Conference","rookie_year":2015,"status":"ACT","sr_id":"sr:player:834641","draft":{"year":2015,"round":2,"number":50,"team":{"id":"768c92aa-75ff-4a43-bcc0-f2798c2e1724","name":"Bills","market":"Buffalo","alias":"BUF","sr_id":"sr:competitor:4376"}}},{"id":"cc69eb61-a6f3-4d24-970d-c31e4dfcf6b8","name":"Barrington Wade","jersey":"54","last_name":"Wade","first_name":"Barrington","abbr_name":"B.Wade","preferred_name":"Barrington","birth_date":"1998-03-16","weight":232,"height":73,"position":"LB","birth_place":"Skokie, IL, USA","high_school":"Niles North (IL)","college":"Iowa","college_conf":"Big Ten Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2197926"},{"id":"d2e2b313-6769-48c6-a217-d167f04068df","name":"D.J. Jones","jersey":"97","last_name":"Jones","first_name":"D.J.","abbr_name":"D.Jones","preferred_name":"D.J.","birth_date":"1995-01-19","weight":305,"height":72,"position":"DT","birth_place":"Greenville, SC, USA","high_school":"Wren (SC)","college":"Ole Miss","college_conf":"Southeastern Conference","rookie_year":2017,"status":"ACT","sr_id":"sr:player:1130003","draft":{"year":2017,"round":6,"number":198,"team":{"id":"f0e724b0-4cbf-495a-be47-013907608da9","name":"49ers","market":"San Francisco","alias":"SF","sr_id":"sr:competitor:4389"}}},{"id":"d4f0aa89-6309-4977-b779-7501eb8c8508","name":"Damarea Crockett","jersey":"28","last_name":"Crockett","first_name":"Damarea","abbr_name":"D.Crockett","preferred_name":"Damarea","birth_date":"1997-12-22","weight":225,"height":71,"position":"RB","birth_place":"Little Rock, AR, USA","high_school":"Little Rock Christian Academy (AR)","college":"Missouri","college_conf":"Southeastern Conference","rookie_year":2019,"status":"ACT","sr_id":"sr:player:1220224"},{"id":"d90f8660-d251-11ec-b16e-cf7159baf83d","name":"Brandon Johnson","jersey":"36","last_name":"Johnson","first_name":"Brandon","abbr_name":"B.Johnson","preferred_name":"Brandon","weight":195,"height":74,"position":"WR","birth_place":"Fort Lauderdale, FL, USA","high_school":"American Heritage (FL)","college":"UCF","college_conf":"American Athletic Conference","status":"ACT","sr_id":"sr:player:1218022"},{"id":"da25e165-3aec-46d0-8f4a-ff48e078c679","name":"Jonathan Kongbo","jersey":"90","last_name":"Kongbo","first_name":"Jonathan","abbr_name":"J.Kongbo","preferred_name":"Jonathan","birth_date":"1996-03-19","weight":254,"height":77,"position":"DE","birth_place":"Zaire,, COD","high_school":"Holy Cross Regional (CAN)","college":"Tennessee","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:1990041"},{"id":"e480b9d0-d254-11ec-b16e-cf7159baf83d","name":"Rodney Williams","jersey":"86","last_name":"Williams","first_name":"Rodney","abbr_name":"R.Williams","preferred_name":"Rodney","birth_date":"1998-04-08","weight":235,"height":76,"position":"TE","birth_place":"Memphis, TN, USA","high_school":"Germantown (TN)","college":"Tennesee-Martin","college_conf":"Ohio Valley Conference","status":"ACT","sr_id":"sr:player:1183166"},{"id":"ea01fa3b-cebd-40c3-9de8-3dc7f5e44e58","name":"McTelvin Agim","jersey":"95","last_name":"Agim","first_name":"McTelvin","abbr_name":"M.Agim","preferred_name":"McTelvin","birth_date":"1997-09-25","weight":309,"height":75,"position":"DT","birth_place":"Texarkana, AR, USA","high_school":"Hope (AR)","college":"Arkansas","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040543","draft":{"year":2020,"round":3,"number":95,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"eaaa4a61-c2a7-4926-8e9b-3ec71be2f991","name":"Jerry Jeudy","jersey":"10","last_name":"Jeudy","first_name":"Jerry","abbr_name":"J.Jeudy","preferred_name":"Jerry","birth_date":"1999-04-24","weight":193,"height":73,"position":"WR","birth_place":"Deerfield Beach, FL, USA","high_school":"Deerfield Beach (FL)","college":"Alabama","college_conf":"Southeastern Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040665","draft":{"year":2020,"round":1,"number":15,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"f1cedce0-d252-11ec-b16e-cf7159baf83d","name":"Kanai'i Mauga","jersey":"43","last_name":"Mauga","first_name":"Kana'i","abbr_name":"K.Mauga","weight":245,"height":74,"position":"LB","birth_place":"Waianae, HI, USA","high_school":"Waianae (HI)","college":"USC","college_conf":"Pacific Twelve Conference","status":"ACT","sr_id":"sr:player:1437406"},{"id":"f3debe3e-27e4-4c4a-867a-ec537b5a7826","name":"Seth Williams","jersey":"19","last_name":"Williams","first_name":"Seth","abbr_name":"S.Williams","preferred_name":"Seth","birth_date":"2000-04-10","weight":211,"height":75,"position":"WR","birth_place":"Cottondale, AL, USA","high_school":"Paul W. Bryant (AL)","college":"Auburn","college_conf":"Southeastern Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2197932","draft":{"year":2021,"round":6,"number":219,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"f4a43515-f437-499a-8c57-086eb579c5af","name":"Ben Braden","jersey":"64","last_name":"Braden","first_name":"Ben","abbr_name":"B.Braden","preferred_name":"Ben","birth_date":"1994-03-09","weight":329,"height":78,"position":"G","birth_place":"Rockford, MI, USA","high_school":"Rockford (MI)","college":"Michigan","college_conf":"Big Ten Conference","rookie_year":2017,"status":"ACT","sr_id":"sr:player:1132831"},{"id":"f7b49d9d-2ce4-459f-8065-fa3b52d28069","name":"Kareem Jackson","jersey":"22","last_name":"Jackson","first_name":"Kareem","abbr_name":"K.Jackson","preferred_name":"Kareem","birth_date":"1988-04-10","weight":183,"height":70,"position":"SAF","birth_place":"Macon, GA, USA","high_school":"Westside (GA)","college":"Alabama","college_conf":"Southeastern Conference","rookie_year":2010,"status":"ACT","sr_id":"sr:player:828531","draft":{"year":2010,"round":1,"number":20,"team":{"id":"82d2d380-3834-4938-835f-aec541e5ece7","name":"Texans","market":"Houston","alias":"HOU","sr_id":"sr:competitor:4324"}}},{"id":"f8f0760e-8f04-45bf-9371-fa33c945bc1c","name":"Justin Strnad","jersey":"40","last_name":"Strnad","first_name":"Justin","abbr_name":"J.Strnad","preferred_name":"Justin","birth_date":"1996-08-21","weight":238,"height":75,"position":"LB","birth_place":"Palm Harbor, FL, USA","high_school":"East Lake (FL)","college":"Wake Forest","college_conf":"Atlantic Coast Conference","rookie_year":2020,"status":"ACT","sr_id":"sr:player:2040535","draft":{"year":2020,"round":5,"number":178,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"faf72326-5e36-4bdd-9843-5d2a6b4ee6b4","name":"Baron Browning","jersey":"56","last_name":"Browning","first_name":"Baron","abbr_name":"B.Browning","preferred_name":"Baron","birth_date":"1999-02-19","weight":240,"height":75,"position":"LB","birth_place":"Fort Worth, TX, USA","high_school":"Kennedale (TX)","college":"Ohio State","college_conf":"Big Ten Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:2198160","draft":{"year":2021,"round":3,"number":105,"team":{"id":"ce92bd47-93d5-4fe9-ada4-0fc681e6caa0","name":"Broncos","market":"Denver","alias":"DEN","sr_id":"sr:competitor:4418"}}},{"id":"fedf6815-1c7e-443c-8d99-633c72e81179","name":"Aaron Patrick","jersey":"94","last_name":"Patrick","first_name":"Aaron","abbr_name":"A.Patrick","preferred_name":"Aaron","birth_date":"1996-12-21","weight":245,"height":76,"position":"DE","birth_place":"Dayton, OH, USA","high_school":"Meadowdale (OH)","college":"Eastern Kentucky","college_conf":"Ohio Valley Conference","rookie_year":2021,"status":"ACT","sr_id":"sr:player:1186592"}]

TeamPlayersResponse teamPlayersResponseFromJson(String str) => TeamPlayersResponse.fromJson(json.decode(str));
String teamPlayersResponseToJson(TeamPlayersResponse data) => json.encode(data.toJson());

List<Players> playerListFromJson(String str) =>
    List<Players>.from(json.decode(str).map((x) => Players.fromJson(x)));

class TeamPlayersResponse {
  TeamPlayersResponse({
      String? id, 
      String? name, 
      String? market, 
      String? alias, 
      String? srId, 
      Franchise? franchise, 
      Venue? venue, 
      Division? division, 
      Conference? conference, 
      List<Coaches>? coaches, 
      List<TeamColors>? teamColors, 
      List<Players>? players,}){
    _id = id;
    _name = name;
    _market = market;
    _alias = alias;
    _srId = srId;
    _franchise = franchise;
    _venue = venue;
    _division = division;
    _conference = conference;
    _coaches = coaches;
    _teamColors = teamColors;
    _players = players;
}

  TeamPlayersResponse.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _market = json['market'];
    _alias = json['alias'];
    _srId = json['sr_id'];
    _franchise = json['franchise'] != null ? Franchise.fromJson(json['franchise']) : null;
    _venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    _division = json['division'] != null ? Division.fromJson(json['division']) : null;
    _conference = json['conference'] != null ? Conference.fromJson(json['conference']) : null;
    if (json['coaches'] != null) {
      _coaches = [];
      json['coaches'].forEach((v) {
        _coaches?.add(Coaches.fromJson(v));
      });
    }
    if (json['team_colors'] != null) {
      _teamColors = [];
      json['team_colors'].forEach((v) {
        _teamColors?.add(TeamColors.fromJson(v));
      });
    }
    if (json['players'] != null) {
      _players = [];
      json['players'].forEach((v) {
        _players?.add(Players.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _market;
  String? _alias;
  String? _srId;
  Franchise? _franchise;
  Venue? _venue;
  Division? _division;
  Conference? _conference;
  List<Coaches>? _coaches;
  List<TeamColors>? _teamColors;
  List<Players>? _players;
TeamPlayersResponse copyWith({  String? id,
  String? name,
  String? market,
  String? alias,
  String? srId,
  Franchise? franchise,
  Venue? venue,
  Division? division,
  Conference? conference,
  List<Coaches>? coaches,
  List<TeamColors>? teamColors,
  List<Players>? players,
}) => TeamPlayersResponse(  id: id ?? _id,
  name: name ?? _name,
  market: market ?? _market,
  alias: alias ?? _alias,
  srId: srId ?? _srId,
  franchise: franchise ?? _franchise,
  venue: venue ?? _venue,
  division: division ?? _division,
  conference: conference ?? _conference,
  coaches: coaches ?? _coaches,
  teamColors: teamColors ?? _teamColors,
  players: players ?? _players,
);
  String? get id => _id;
  String? get name => _name;
  String? get market => _market;
  String? get alias => _alias;
  String? get srId => _srId;
  Franchise? get franchise => _franchise;
  Venue? get venue => _venue;
  Division? get division => _division;
  Conference? get conference => _conference;
  List<Coaches>? get coaches => _coaches;
  List<TeamColors>? get teamColors => _teamColors;
  List<Players>? get players => _players;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['market'] = _market;
    map['alias'] = _alias;
    map['sr_id'] = _srId;
    if (_franchise != null) {
      map['franchise'] = _franchise?.toJson();
    }
    if (_venue != null) {
      map['venue'] = _venue?.toJson();
    }
    if (_division != null) {
      map['division'] = _division?.toJson();
    }
    if (_conference != null) {
      map['conference'] = _conference?.toJson();
    }
    if (_coaches != null) {
      map['coaches'] = _coaches?.map((v) => v.toJson()).toList();
    }
    if (_teamColors != null) {
      map['team_colors'] = _teamColors?.map((v) => v.toJson()).toList();
    }
    if (_players != null) {
      map['players'] = _players?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "030f3ecf-f32f-497d-96a8-8f28d44fc311"
/// name : "Travis Fulgham"
/// jersey : "15"
/// last_name : "Fulgham"
/// first_name : "Travis"
/// abbr_name : "T.Fulgham"
/// preferred_name : "Travis"
/// birth_date : "1995-09-13"
/// weight : 215
/// height : 74
/// position : "WR"
/// birth_place : "Ashburn, VA, USA"
/// high_school : "Broad Run (VA)"
/// college : "Old Dominion"
/// college_conf : "Conference USA"
/// rookie_year : 2019
/// status : "ACT"
/// sr_id : "sr:player:1220002"
/// draft : {"year":2019,"round":6,"number":184,"team":{"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419"}}

Players playersFromJson(String str) => Players.fromJson(json.decode(str));
String playersToJson(Players data) => json.encode(data.toJson());
class Players {
  Players({
      String? id, 
      String? name, 
      String? jersey, 
      String? lastName, 
      String? firstName, 
      String? abbrName, 
      String? preferredName, 
      String? birthDate, 
      int? weight, 
      int? height, 
      String? position, 
      String? birthPlace, 
      String? highSchool, 
      String? college, 
      String? collegeConf, 
      int? rookieYear, 
      String? status, 
      String? srId, 
      Draft? draft,
  }){
    _id = id;
    _name = name;
    _jersey = jersey;
    _lastName = lastName;
    _firstName = firstName;
    _abbrName = abbrName;
    _preferredName = preferredName;
    _birthDate = birthDate;
    _weight = weight;
    _height = height;
    _position = position;
    _birthPlace = birthPlace;
    _highSchool = highSchool;
    _college = college;
    _collegeConf = collegeConf;
    _rookieYear = rookieYear;
    _status = status;
    _srId = srId;
    _draft = draft;
}

  Players.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _jersey = json['jersey'];
    _lastName = json['last_name'];
    _firstName = json['first_name'];
    _abbrName = json['abbr_name'];
    _preferredName = json['preferred_name'];
    _birthDate = json['birth_date'];
    _weight = json['weight'];
    _height = json['height'];
    _position = json['position'];
    _birthPlace = json['birth_place'];
    _highSchool = json['high_school'];
    _college = json['college'];
    _collegeConf = json['college_conf'];
    _rookieYear = json['rookie_year'];
    _status = json['status'];
    _srId = json['sr_id'];
    _draft = json['draft'] != null ? Draft.fromJson(json['draft']) : null;
  }
  String? _id;
  String? _name;
  String? _jersey;
  String? _lastName;
  String? _firstName;
  String? _abbrName;
  String? _preferredName;
  String? _birthDate;
  int? _weight;
  int? _height;
  String? _position;
  String? _birthPlace;
  String? _highSchool;
  String? _college;
  String? _collegeConf;
  int? _rookieYear;
  String? _status;
  String? _srId;
  Draft? _draft;
Players copyWith({  String? id,
  String? name,
  String? jersey,
  String? lastName,
  String? firstName,
  String? abbrName,
  String? preferredName,
  String? birthDate,
  int? weight,
  int? height,
  String? position,
  String? birthPlace,
  String? highSchool,
  String? college,
  String? collegeConf,
  int? rookieYear,
  String? status,
  String? srId,
  Draft? draft,
}) => Players(  id: id ?? _id,
  name: name ?? _name,
  jersey: jersey ?? _jersey,
  lastName: lastName ?? _lastName,
  firstName: firstName ?? _firstName,
  abbrName: abbrName ?? _abbrName,
  preferredName: preferredName ?? _preferredName,
  birthDate: birthDate ?? _birthDate,
  weight: weight ?? _weight,
  height: height ?? _height,
  position: position ?? _position,
  birthPlace: birthPlace ?? _birthPlace,
  highSchool: highSchool ?? _highSchool,
  college: college ?? _college,
  collegeConf: collegeConf ?? _collegeConf,
  rookieYear: rookieYear ?? _rookieYear,
  status: status ?? _status,
  srId: srId ?? _srId,
  draft: draft ?? _draft,
);
  String? get id => _id;
  String? get name => _name;
  String? get jersey => _jersey;
  String? get lastName => _lastName;
  String? get firstName => _firstName;
  String? get abbrName => _abbrName;
  String? get preferredName => _preferredName;
  String? get birthDate => _birthDate;
  int? get weight => _weight;
  int? get height => _height;
  String? get position => _position;
  String? get birthPlace => _birthPlace;
  String? get highSchool => _highSchool;
  String? get college => _college;
  String? get collegeConf => _collegeConf;
  int? get rookieYear => _rookieYear;
  String? get status => _status;
  String? get srId => _srId;
  Draft? get draft => _draft;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['jersey'] = _jersey;
    map['last_name'] = _lastName;
    map['first_name'] = _firstName;
    map['abbr_name'] = _abbrName;
    map['preferred_name'] = _preferredName;
    map['birth_date'] = _birthDate;
    map['weight'] = _weight;
    map['height'] = _height;
    map['position'] = _position;
    map['birth_place'] = _birthPlace;
    map['high_school'] = _highSchool;
    map['college'] = _college;
    map['college_conf'] = _collegeConf;
    map['rookie_year'] = _rookieYear;
    map['status'] = _status;
    map['sr_id'] = _srId;
    if (_draft != null) {
      map['draft'] = _draft?.toJson();
    }
    return map;
  }

}

/// year : 2019
/// round : 6
/// number : 184
/// team : {"id":"c5a59daa-53a7-4de0-851f-fb12be893e9e","name":"Lions","market":"Detroit","alias":"DET","sr_id":"sr:competitor:4419"}

Draft draftFromJson(String str) => Draft.fromJson(json.decode(str));
String draftToJson(Draft data) => json.encode(data.toJson());
class Draft {
  Draft({
      int? year, 
      int? round, 
      int? number, 
      Team? team,}){
    _year = year;
    _round = round;
    _number = number;
    _team = team;
}

  Draft.fromJson(dynamic json) {
    _year = json['year'];
    _round = json['round'];
    _number = json['number'];
    _team = json['team'] != null ? Team.fromJson(json['team']) : null;
  }
  int? _year;
  int? _round;
  int? _number;
  Team? _team;
Draft copyWith({  int? year,
  int? round,
  int? number,
  Team? team,
}) => Draft(  year: year ?? _year,
  round: round ?? _round,
  number: number ?? _number,
  team: team ?? _team,
);
  int? get year => _year;
  int? get round => _round;
  int? get number => _number;
  Team? get team => _team;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['year'] = _year;
    map['round'] = _round;
    map['number'] = _number;
    if (_team != null) {
      map['team'] = _team?.toJson();
    }
    return map;
  }

}

/// id : "c5a59daa-53a7-4de0-851f-fb12be893e9e"
/// name : "Lions"
/// market : "Detroit"
/// alias : "DET"
/// sr_id : "sr:competitor:4419"

Team teamFromJson(String str) => Team.fromJson(json.decode(str));
String teamToJson(Team data) => json.encode(data.toJson());
class Team {
  Team({
      String? id, 
      String? name, 
      String? market, 
      String? alias, 
      String? srId,}){
    _id = id;
    _name = name;
    _market = market;
    _alias = alias;
    _srId = srId;
}

  Team.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _market = json['market'];
    _alias = json['alias'];
    _srId = json['sr_id'];
  }
  String? _id;
  String? _name;
  String? _market;
  String? _alias;
  String? _srId;
Team copyWith({  String? id,
  String? name,
  String? market,
  String? alias,
  String? srId,
}) => Team(  id: id ?? _id,
  name: name ?? _name,
  market: market ?? _market,
  alias: alias ?? _alias,
  srId: srId ?? _srId,
);
  String? get id => _id;
  String? get name => _name;
  String? get market => _market;
  String? get alias => _alias;
  String? get srId => _srId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['market'] = _market;
    map['alias'] = _alias;
    map['sr_id'] = _srId;
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

/// id : "51ba5ef6-cab8-4815-9333-06f598746486"
/// full_name : "Nathaniel Hackett"
/// first_name : "Nathaniel"
/// last_name : "Hackett"
/// position : "Head Coach"

Coaches coachesFromJson(String str) => Coaches.fromJson(json.decode(str));
String coachesToJson(Coaches data) => json.encode(data.toJson());
class Coaches {
  Coaches({
      String? id, 
      String? fullName, 
      String? firstName, 
      String? lastName, 
      String? position,}){
    _id = id;
    _fullName = fullName;
    _firstName = firstName;
    _lastName = lastName;
    _position = position;
}

  Coaches.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _position = json['position'];
  }
  String? _id;
  String? _fullName;
  String? _firstName;
  String? _lastName;
  String? _position;
Coaches copyWith({  String? id,
  String? fullName,
  String? firstName,
  String? lastName,
  String? position,
}) => Coaches(  id: id ?? _id,
  fullName: fullName ?? _fullName,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  position: position ?? _position,
);
  String? get id => _id;
  String? get fullName => _fullName;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get position => _position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['position'] = _position;
    return map;
  }

}

/// id : "1bdefe12-6cb2-4d6a-b208-b04602ae79c3"
/// name : "AFC"
/// alias : "AFC"

Conference conferenceFromJson(String str) => Conference.fromJson(json.decode(str));
String conferenceToJson(Conference data) => json.encode(data.toJson());
class Conference {
  Conference({
      String? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  Conference.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
  }
  String? _id;
  String? _name;
  String? _alias;
Conference copyWith({  String? id,
  String? name,
  String? alias,
}) => Conference(  id: id ?? _id,
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

/// id : "324decdd-aa1b-4074-8958-c009d8fac31a"
/// name : "AFC West"
/// alias : "AFC_WEST"

Division divisionFromJson(String str) => Division.fromJson(json.decode(str));
String divisionToJson(Division data) => json.encode(data.toJson());
class Division {
  Division({
      String? id, 
      String? name, 
      String? alias,}){
    _id = id;
    _name = name;
    _alias = alias;
}

  Division.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _alias = json['alias'];
  }
  String? _id;
  String? _name;
  String? _alias;
Division copyWith({  String? id,
  String? name,
  String? alias,
}) => Division(  id: id ?? _id,
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