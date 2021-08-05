--
-- File generated with SQLiteStudio v3.3.3 on Fri Aug 6 00:09:35 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: days
CREATE TABLE days (
    id             INTEGER PRIMARY KEY AUTOINCREMENT
                           NOT NULL
                           UNIQUE,
    ord            INTEGER,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING,
    programs_id    INT     REFERENCES programs (id) 
);

INSERT INTO days (
                     id,
                     ord,
                     en_name,
                     ru_name,
                     en_description,
                     ru_description,
                     programs_id
                 )
                 VALUES (
                     3,
                     1,
                     'Biceps Train',
                     'Бицепс',
                     'Tuesday',
                     'Вторник',
                     1
                 );

INSERT INTO days (
                     id,
                     ord,
                     en_name,
                     ru_name,
                     en_description,
                     ru_description,
                     programs_id
                 )
                 VALUES (
                     4,
                     2,
                     'Back Train',
                     'Спина',
                     'Wensday',
                     'Среда',
                     1
                 );


-- Table: equipment
CREATE TABLE equipment (
    id      INTEGER PRIMARY KEY
                    UNIQUE,
    en_name STRING,
    ru_name STRING
);

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          1,
                          'Bodyweight',
                          'Собственный вес'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          2,
                          'Rubber band',
                          'Резиновый жгут'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          3,
                          'Barbell',
                          'Штанга'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          4,
                          'Dumbbels',
                          'Гантели'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          5,
                          'Kettlebells',
                          'Гири'
                      );

INSERT INTO equipment (
                          id,
                          en_name,
                          ru_name
                      )
                      VALUES (
                          6,
                          'Training apparatus',
                          'Тренажёр'
                      );


-- Table: exercises
CREATE TABLE exercises (
    id             INTEGER PRIMARY KEY
                           NOT NULL
                           UNIQUE,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING,
    equipment_id   INTEGER REFERENCES equipment (id) 
);

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          1,
                          'Push Up',
                          'Отжимания',
                          NULL,
                          NULL,
                          1
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          2,
                          'Shrugs',
                          'Шраги',
                          'DB',
                          NULL,
                          1
                      );

INSERT INTO exercises (
                          id,
                          en_name,
                          ru_name,
                          en_description,
                          ru_description,
                          equipment_id
                      )
                      VALUES (
                          3,
                          'Push up with Rubber band',
                          'Отжимания с резиновой лентой',
                          'Take rubber band in hands.',
                          NULL,
                          1
                      );


-- Table: load
CREATE TABLE load (
    exercises_id INTEGER REFERENCES exercises (id),
    muscles_id   INTEGER REFERENCES musсles (id) 
);

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     1,
                     3
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     2,
                     1
                 );

INSERT INTO load (
                     exercises_id,
                     muscles_id
                 )
                 VALUES (
                     3,
                     3
                 );


-- Table: log_days
CREATE TABLE log_days (
    id      INTEGER PRIMARY KEY AUTOINCREMENT
                    UNIQUE
                    NOT NULL,
    start   STRING  NOT NULL,
    finish  STRING,
    days_id INTEGER
);


-- Table: log_ex
CREATE TABLE log_ex (
    id           INTEGER NOT NULL
                         PRIMARY KEY AUTOINCREMENT,
    log_days_id  INT,
    exercises_id INTEGER,
    repeat       INTEGER,
    weight       REAL,
    FOREIGN KEY (
        log_days_id
    )
    REFERENCES log_days (id),
    FOREIGN KEY (
        exercises_id
    )
    REFERENCES exercises (id) 
);


-- Table: musсles
CREATE TABLE musсles (
    id      INTEGER NOT NULL,
    en_name STRING,
    ru_name STRING,
    icon    BLOB
);

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        0,
                        'Neck',
                        'Шея',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        1,
                        'Traps',
                        'Трапеция',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000007B649444154789CED9D5B8C5D5519C77FDFDAE7CCB5763A43072CF6426A2F86161210442A6AAA6DA77D68B1CA740A260A5A1B08260679213E0D4F3E99A85184268A119C76E60429D480BD601B298A2915057D681A4B14B52D6AE9057AA69D73F6E7C3198BD3CE65AD75F659FBD4B37FC9493AD3F5EDFFB7D77FAFCB5E7BED339091919191919191919191919191D14848DA095C8C0EDC7915C787BFC53BF11ACEC69D94B4BA1C73A2B4CB09DACCF3B4CA8372DFD36F25946A22D48D01FA68EFB59C19798413A54F50AA515E39942EF31A6DB9AFC8FD3F3B50130D475237407FB0FE4ADED121FE55FA2471205101BACD1F6893B572FF336F06529D309554D0FEFE1C9DBFFF3E6F9537715E4D2A49E450BAA3ED749EBA4BEED9379C460A3535405FD99CE7DF276F45CC6DC022D0C5A0B341DA3917CFE0C5A2A0B5CCC00223F0B156A5454E82BE0BF2379043687C0835FB693EF61B59BEAF542BF9C40DD0E7D634134D5F0F6CC4F02994F74D58F88FE7E068CDCECD8EAB73B0A479B212A7117E09BA95B775BB6C289C4F523E310374A8B7898EE85E247E08649655D099185E2E2695821FB7B4C0F4C8B6F43F10BE4967C76372D3969124E4133140F7F4DD4CCC8F80A5CEC10786E164398934DCE98AE0C32D3E91AFA3F13DD25338586D0A550F7EBABBEF0BC4BC884FE503CCCB559B823F73BDB5AF43CC7EDDD9F7F96A53A8CA00DDB9E18B288F039376A293D29D83F6142641EDA6A2ED4F0BC213BA73E397AB3988F799EBEEDEDB10F96135C7002A9DE082BC5FAC01ACBBEF8B58E8A9391641F451DDD37BABEF01BC2A4F77AC6D43CD13F89FFE58BA7330DD2395BC81BCC730D6616066625D5F8ED83CA97BEFF61A4CFCAEDEE6D6AF02D778C58E87001F6A729F123401390F031637273D019F4FA978AF4FA0B3013AD41BA1F2808FD8A4744430CBF1AA6C96CAC785AB7395169034AA0F6A7FBFF381DD33E992E508EF778EB36161935B97D2662A1F5B9A041635B9E76585CC66D99F3EEE1AE56E80CA2AE7185B9A04963A740F338CDBD57C6DB3DF98618B9AD5AE211E0670A3738C0B3323986D31433140570EAE88ECA60273F2D09DCC9C6142841B5C437C3AC3851E316E2CCA4F3D4B9993873C9556F381290C9B19C1E25A753D6358E41AE06E80D0E91CE38A11B8BEB972758FC70C33F6DE614153E577E3714504D7B7845A789FE11AE03E1956DA9C637C88801B5AE08D11787304CA0AAD06664530375F31E97FCBDED85A2977AC0467E3CAF4746E1EAE49E486CB9689577E27C0E76EA4084CF388734780F9F9CA672A222A951DB6C22FE65DD7009F31E094474CA370D23520332049D4BD6E3CA6A1FA57E7984641D4F901BFBB01465E778E6914D4BD6E7C5AC06BCE318D82C7C5E96E401CBDEA1CD328C4F23BD7108F41B874D43DA64130EE75E36E402EF711E79886413EEA1AE1D105C5C93F0BF87FC1E33989D30A89BED0F741CA1C768D6B2014A2C5B26AE0B06D805B0B28B399ACF22743D0F2975C025CBBA08D8EE51B0FE14E97E2D606E8F3BD8B81B9CE09351EF3744F9FF57301FB169033B778A5D38894B9D9B6A8BD01B15EE7954C2322F675656F8091055EC9549E1F5CAEF8BDB4A1F675656F8062B7E5FCD240E735F23AC26FE95DECEBCA6516E4B91748EAEAAD44477C73B7AE2B0703C4E7316409F8B3475CBD7018BC5E1DB47E36EC60807A6C3ED563A85EC6ABA7721038E61E86755DB97441EE0688BC82A12EDEC7F542E50082F312335A0B0354D703471C13D947590FE0D78CD326464B0751F63AC61D41F9AC6D616B03A4676807D3E2A5A83C8CDDF4AC8431DB6475E104F0B2AD4EDD20BC24AB0B2730E6A754C6B2A928A2F230F9D625D233F8735B19A7B5205956284ACFB67E4CB404617211919FC88AADC747FFFDB48B4E5DA06C0790155B8FA30C4C517A07265A2A3DDBFA65F98F9DEE1DBC36CACB8A8123B272702DAAEB18BF5B3A85C837DE5331052EAF6EA88C4AE1C24F9A7F08383D4EB923286B65D5E03A5931E0D63D8F52D59B0A13744B312A9B2E5CFD807C7AE02FA8EEAA462B30BBA467DB852D26B2FAC9A3A86CE6BD8B6818D17ED7EE663C927B517BCF5DF3D1F277801764E5E0B72FF9FF9D1BEF40B4304E68FD217A87AC1C7AEAE25FEBAEBEAF232C47A2AFF95EF197482571101B74EFDD2D8C148FE2B1833830A7C9B75EE5DA97FB12EC05DDD113DA1E4AAF0A0AA12A1F021A0080E8B6A07A3E98B0398635A05D7F0524FA6D2309739EA86D7F48C1A006C8B24211A8E7AD8DAF86EC7E20740BA850C777C5FADBD08A6918F0460A9A76A809BE741EDE0095BF07D7B4C5C4C1734BA105C83FC36B5A12133CB7145A4039EDAFE99B1835C1734BE7EB22EB15530E5E1FE10D107365704D5B34EA0E2D19DE00C39CE09AF604CF2D853120AE5F03446787964C631614FC241D68801650DF3BAC1BC100AD6303745E68C534BAA08EF09AB648EDBF8AE72252188439145CD39EE0B9A5310D7D3CB8A63DC1730B6F407BFC18681DBEECAD4799166F09AD1ADC80D187329B20F53FDD301691FB46730B4A2A6B41B26AE839D047D2D09E80EFC9CAC167D2104E6F31AE6BC603C0CED4F4FF8BEA2FC81F4FEDEDFFD40C909BB68C502CF602BF4E2B07E025868737D4F26FC44C45AACBD172FBB36738777625E8EE14E4F7512CAE91DB9F3D9382F605527F1E206B779C25DFB66ECADDD6C9B2837C6BEA950F7560008CEE9A7B3BFE0CE8776B2FC616BA3A3E177AFB49464646464646464646464646464606C07F001CABEB9724733F410000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        2,
                        'Shoulders',
                        'Плечи',
                        'X'89504E470D0A1A0A0000000D4948445200000060000000600806000000E298773800000006624B474400FF00FF00FFA0BDA793000007F449444154789CED9D6B8C555715C77F6B9F7BE7CDA30352E88BA42024D2AAD1B634F51329C35095571DA43ED08620516AD2B489C61863A6D12FC698404355888D6D9529309AD6D2D4823410637D04B0895F7C10300D96618A1D0AC8DC997BEF39CB0F77A0753A3067EF73669F8B737EC924F3386BFFD75DFFBDF7D9F79C7DEE404E4E4E4E4E4E4E4E4E4E4E4E4ECE6442B24E60347A706D1B15F339942E848F00ED099B1C003D8A9A5F4071A774FEEC621A79A645DD18A0FBD6CF82CA6684AF82CE982099F3A04F512D7E5F3EBEF35F13A46145E606E8BEF5AD50F91AA25F079A3DC996417F8CE8B7A5A3F79C27CD31C9CC00EDEE367CECAF9F27E27B08B3B3C942DE02FD0EC5FE2764C9A16A26194C64E3BA7D450BC3858D54F51394751EC35C4F396A26520322DCD9046D662253189F0B111C1902543112D1604A34D24F518E53302F12F6FD441EFD4369A2E45337401FBF6F2A61E37719D42E2E84B309AFA2D11EC0479BD24EC18E23437036BCF2DF0B285382D3B4CA1E0AC56FC943BDFF49533E3503F489B56D94AA4F73B6BA9AB2C6EBD606B8B735AD14DC38701134E6B10D2664863CC7CCA90FCA17D2594DA532FE75DB9A2F7266E80CFD95FB63171F204A433D014AFCE20394A380BEB08BE36FFF5BB7AE5E9F460A890DD02DAB7670B2F21417D57E2E2966BC0813C71C06B58953E133BA65CD8F92A690C800FDC19A2739157EC9B927B766BE0A76CF21523855F9B26E5DFD641279670374EBAA87E8AF6CB01AC2A3B92E48109C12ED097250E08DEA06DDB67A936B134EF6EBF6153339491FC35A701506E08EA6EC4D1808E1E850B2369AA4CA9C29B36473CF59DB50B7117031783A71F11B04A665FC1E006A1DA021E15438A4054A833F7509B5AE8076AF6DE0AD70B98BD8FF30A700A60ECE0102CC4ED6970018083FA99B36156DC3ECBBE0CCEAC3564BCD2B312785179D1637A4904B590316BDB9D936CCBE9083DA651D339AE906A6D4C1F4738929A696535286F501DB107BD5619D6F1D339AF90D899B489D5B53C8A9ACEFB70D7130209A6A1DF36EDA83EC573E63312348B6240518D269B621F60684B86729C07CEBF3943FE63524BB3A56B5AF8D8301EA9EE28D05985687BDFF12D30DDC90A08344F6B5B137401CDFFBB61858D0E814EA9505C55AAE2E18FBDAD82B15C4FECA4F007CB8910493973F0A52CBB5E030D003FBDAD81B1088DDAD3B23F0A12668ADA365E778B41AB8BDC1BE3A052AB652F65569E47CEC638391DE34E35AE8FAA39859A8751C9BD48B267E6D46B037A028AFC73AAEC5C05D4DD766F12F313380BB9AA13966991AF9A7AD848301FAE7ABB728704B1116D7C10DF7346833B0B8B9F69AC63B2D14CD6BB6CDDB57C8145E1EF3F701705301EE6E82850D6E27B17AA548ED35DDDD023716AF3C2D19F3926DD3F657A1C2CA3F68945A811B04A61A981ED4A69A6B78B689459BC0071A6A4BD58108CE85702E82B24255A15C3E66DBA4BD011F6CBB9928EBBBE91953109815D4BEDE8DE85CE06F364DD94F4151F48875CC6441C5BA365613B5BEB26E1E21C76CE326110AC14259D6137B2AB21B01219BC88B7F35040D37D804D84E41D6371C261DC2676C0E8F6D80FE7AED42E016EB84261F73F5C0BA05710F8E3F020A66B1533A9391903BE31E6AB18F536F774A663222F16B15DF0023AEF782276C6FBD07DC766C69FC5AC5374099E3940CFAB65B5C5DE0F6F892C4AF95CD2AC8F1312279D32DAE2E70CD3D76AD2C0C90368744AAC07187B87AE1186E4F314C897BA085010EFBFFD1D3A85A5FA2AD1FE42870DA3E8CD8B5B29982EC0D103982E1B0755CBDA07218E1EAF73FC68C9B080354D700272C133944A887C9FE61241722B47A14E5A065DC0994FBE31E1CDB00E9DCB397B6E836541E23DEF2AC8A31BB6479EF00F0C7B83A7583F0AA2CEF1DC0989DD4CE65E35142E5318ACD8BA473F78B7165ACAE05C93DBD25E9DCD58D0916215C5D44E41959FA6CFFC8F7CFD9E8D405CAF300B2F4D97E949E718EDE8B096E93CE5DDDB2E429ABF70E4E376D6569CF09E9D8BD02D5958C3D2D9D43E49BEFA8985EAEAD692844A5F7F24F5AFC068CB91BE404CA0A59B67BA52CEDB19B9E474874D7FC0AD35284CAC6CBBD1F907B7B5E47757F122DCFEC97CE5D272FFD20CB7FDE87CA26DEE944438876DB4E376391DE83DA073E7B2B1A6E055E918EDD5BDEF3F77D0F7421DA3B4668FD21DA251D7B7E39FAD7BA7FDDA3084B90E061D71EFF1EA9341A89831E7CB0894AA90F98EE4BD391F3149BAFB79DCB5DF1B67167E4053DEF4B2F01BDBE8A0F1E0D00407497573D178CDF1CFD1AD0AABF05CA5E35ED2813B4FCCEA7A05703E49EDE12F0179F9A96BCE673FA01DF23A0461DBF2BD63FF956CCC200EB1DC4DE50E3FDD2B97F0354DEF0AE19171379CF2D83112067FC6BC624C27B6E198C8030C907DC4C2C6ABCE7F67FF004458A98D07B3DFC1B20669677CDB868F03EDF92FE0D30DCEC5D333EDE73CBE01C10D5AF01A237F996CC6215E4FD455A300946407DEFB09E0C06681D1BA0737D2B663105597FA68E3FE43ADF8A199C84F9BB77CDF878CF2D8B65A8D3C73B7AC27B6EFE0D688DB683F679D71D17EDA32DDAE15BD5BB012337653662F7B9E5138FC8574672F34A26D78264D99E97407F9885F615D8261DBB7F9585707617E3DAA73F02ECCB4CFF12AA2F53ECCFECE9FFCC0C903B76542895D602BFCF2A07E05586863E9DD53FF0818C2F47CBAA172E303CD801FA9B0CE40F512ADD27AB5EB89081F66532BF1F202BF60E526C5939EE6EEB74D94BB139F3E2431D180023BBE6CE46AB411F9F783176D03EED53BEB79FE4E4E4E4E4E4E4E4E4E4E4E4E4E4E400FC17BF161F92B71851BE0000000049454E44AE426082''
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        3,
                        'Chest',
                        'Грудь',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        4,
                        'Mid-back (Traps)',
                        'Середина спины',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        5,
                        'Biceps',
                        'Бицепсы',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        6,
                        'Triceps',
                        'Трицепсы',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        7,
                        'Forearms',
                        'Предплечья',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        8,
                        'Abdominals',
                        'Брюшной пресс',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        9,
                        'Lats',
                        'Широчайшие мышцы спины',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        10,
                        'Lowerback',
                        'Нижняя часть спины',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        11,
                        'Glutes',
                        'Ягодицы',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        12,
                        'Quards',
                        'Квадрицепсы',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        13,
                        'Hamstrings',
                        'Бицепс бедра',
                        NULL
                    );

INSERT INTO musсles (
                        id,
                        en_name,
                        ru_name,
                        icon
                    )
                    VALUES (
                        14,
                        'Calves',
                        'Икры',
                        NULL
                    );


-- Table: programs
CREATE TABLE programs (
    id             INTEGER PRIMARY KEY AUTOINCREMENT
                           NOT NULL
                           UNIQUE,
    en_name        STRING,
    ru_name        STRING,
    en_description STRING,
    ru_description STRING
);

INSERT INTO programs (
                         id,
                         en_name,
                         ru_name,
                         en_description,
                         ru_description
                     )
                     VALUES (
                         1,
                         'Rubber Band',
                         'Резиновая лента',
                         '7 days a weeks',
                         '7 дней в неделю'
                     );

INSERT INTO programs (
                         id,
                         en_name,
                         ru_name,
                         en_description,
                         ru_description
                     )
                     VALUES (
                         2,
                         'Bodyweight',
                         'Собственный вес',
                         '2 days a week',
                         '2 дня в неделю'
                     );

INSERT INTO programs (
                         id,
                         en_name,
                         ru_name,
                         en_description,
                         ru_description
                     )
                     VALUES (
                         3,
                         '5x5',
                         '5 на 5',
                         'Base powerlifting program.',
                         'Базовая программа пауэрлифтинга.'
                     );


-- Table: user
CREATE TABLE user (
    id          INTEGER NOT NULL
                        PRIMARY KEY,
    birthday    DATE,
    sex         INTEGER,
    programs_id INTEGER
);

INSERT INTO user (
                     id,
                     birthday,
                     sex,
                     programs_id
                 )
                 VALUES (
                     1,
                     NULL,
                     NULL,
                     1
                 );


-- Table: workouts
CREATE TABLE workouts (
    id           INTEGER PRIMARY KEY
                         UNIQUE,
    ord          INTEGER DEFAULT (0) 
                         NOT NULL,
    days_id      INTEGER REFERENCES days (id),
    exercises_id INTEGER REFERENCES exercises (id),
    sets         INTEGER DEFAULT (3) 
                         NOT NULL,
    repeats      INTEGER DEFAULT (8) 
                         NOT NULL,
    rest         INTEGER DEFAULT (90) 
                         NOT NULL,
    weight       DOUBLE  NOT NULL
                         DEFAULT (10) 
);

INSERT INTO workouts (
                         id,
                         ord,
                         days_id,
                         exercises_id,
                         sets,
                         repeats,
                         rest,
                         weight
                     )
                     VALUES (
                         10,
                         7,
                         3,
                         2,
                         1,
                         8,
                         90,
                         10.0
                     );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
