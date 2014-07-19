case Rails.env
  
  when "development"
  
    users = [{
      :admin  => 'mamyashev@orfogr.ru'
    },{
      :editor => 'timofeev@orfogr.ru'
    }  ,{
      :registered  => 'akopov@orfogr.ru'
    }]
    
    # users_confirmed = []
    
    password ='_Q@E*(BEQ@_aekjsf)'
    
    lorem = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    
    
    users.each do |account|
      account.each do |key, value|
        user = User.new(
          :email => value, 
          :password => password, 
          :password_confirmation => password
        )
        user.confirm!
        user.save
        user.roles.create(:name=>key.to_s)
      # users_confirmed.push(user)
      end
    end
      
    for i in 1..100 
      News.create({
        :date => rand(90.days).ago, 
        :title => 'seo title', 
        :keywords => 'seo keywords', 
        :description => 'seo description', 
        :url => 'god-save-putin', 
        :head =>  'Заголовок новости '+i.to_s, 
        :anounce => 'Внимание, анонс новости 2'+i.to_s, 
        :body => lorem, 
        :status => true
      })
    end

    #fill some pages
    [
      {
        :parent => 0, 
        :url => 'index',
        :title => '',
        :keywords => '',
        :description => '',
        :head => 'Здравствуйте,', 
        :body => "<p>Данный проект предназначен для работы  в составе глобальной системы использования специальных дистанционных технологий в обучении русскому языку за рубежом на базе зарубежных представительств Россотрудничества.</p>",
        :status => true
      },{
        :parent => 0, 
        :url => 'contacts',
        :title => '',
        :keywords => '',
        :description => '',
        :head => 'Контакты', 
        :body => "
        <p>125009, г.Москва, ул. Воздвиженка, дом 18/9
        <br><br>
        Контактные данные:<br>
        Телефон: +7(495)690-12-45<br>
        Факс: +7(495)609-92-10<br>
        E-mail: rossotr@rs.gov.ru</p>",
        :status => true
      }, {
        :parent => 0, 
        :url => 'about',
        :title => '',
        :keywords => '',
        :description => '',
        :head => 'О проекте', 
        :body => "<p>Назначение программы – хранение образовательных программ и контента в центре (Россотрудничество, г. Москва) для последующего распространения в интересах заказчика.
        <p>Цель создания программы – предоставление возможности накопления и распространения обучающих программ и сопутствующего контента, сокращение времени распространения новых обучающих программ и материалов. </p>
        <p>Федеральное агентство по делам Содружества Независимых Государств, соотечественников, проживающих за рубежом, и по международному гуманитарному сотрудничеству (Россотрудничество) было создано в сентябре 2008 года в соответствии с Указом Президента Российской Федерации от 6 сентября 2008 года No 1315.</p>
        <p>В своей деятельности Агентство подведомственно Министерств у иностранных дел Российской Федерации и руководствуется Конституцией Российской Федерации, федеральными конституционными законами, федеральными законами, нормативными правовыми актами Президента и Правительства Российской Федерации, международными договорами, нормативными правовыми актами МИД России.</p>
        <p>Россотрудничество представлено в 77 странах 59 российскими центрами науки и культуры, 8 их филиалами (4 из которых в Индии) и 18 представителями федерального органа в составе дипломатических миссий Российской Федерации. Географически Россотрудничество охватывает территорию от Соединенных Штатов Америки до Японии и от Финляндии до Аргентины.</p>
        <p>В ближайшем будущем, наряду с открытием новых представительств и культурных центров, планируется активнее использовать так называемый «региональный принцип работы», когда крупный культурный центр будет распространять свою деятельность не только на страну пребывания, но и на близлежащие страны, где нет российских культурных центров. В других регионах планеты деятельность Агентства также будет носить сетевой характер.</p>
        <p>Приоритетным направлением деятельности Россотрудничества являются государства-участники Содружества Независимых Государств. Разработан перспективный план открытия российских центров науки и культуры и представительств Агентства до 2020 года.</p>
        <p>Агентство обладает реально действующей системой поддержки русского языка за рубежом. Ведется активная работа по продвижению российских образовательных услуг и расширению сотрудничества между образовательными учреждениями стран партнеров. У деляется большое внимание работе с выпускниками российских (советских) вузов. Тысячи людей, и особенно молодежи, обучаются сегодня на курсах русского языка при загранучреждениях Россотрудничества во многих странах мира. В представительствах проводятся экзаменационные тесты, по результатам которых можно получить государственный сертификат, подтверждающий уровень владения русским языком. Заботясь о распространении русского языка, Агентство создает условия для его практического применения, а также получения образования на русском языке. Представительства Россотрудничества способствуют набору иностранных студентов в российские вузы и поддерживают связи с их выпускниками, которых по всему миру насчитывается более 500 тысяч. </p>
        <p>Стратегическим инструментом реализации политики в области русского языка стала Федеральная целевая программа «Русский язык» на 2011-2015 годы, заказчиками которой выступили Министерство образования и науки Российской Федерации и Россотрудничество. Данная Программа утверждена Постановлением Правительства России от 20 июня 2011 г. N 492 и призвана стать одним из краеугольных камней формирования положительного образа страны за рубежом и поддержки российской культуры и русского языка.</p>",
        :status => true
      },{
        :parent => 0, 
        :url => 'help',
        :title => '',
        :keywords => '',
        :description => '',
        :head => 'Помощь', 
        :body => 'Не поможем',
        :status => true
      }
    ].each do |page| 
      # page[:body] = raw( page[:body])
      Page.create(page) 
    end


    root = Category.create(:name=> '', :url => "root")
    child1 = root.children.create(:name=> 'Основное общее образование', :url => "general-common")
    # p child1.inspect
    # p child1['id']
    child2 = root.children.create(:name=> 'Среднее (полное) общее образование', :url => "middle-common")
    child3 = root.children.create(:name=> 'Начальное профессиональное образование', :url => "begin-professional")
    child4 = root.children.create(:name=> 'Среднее профессиональное образование', :url => "middle-professional")
    child5 = root.children.create(:name=> 'Дополнительное образование', :url => "addon")
    

    def addUnits units, category_id
      units.each do |unit|
        # p unit.inspect
        unit[:size] = 0 if !defined? unit[:size]
        unit[:version] = 1 if !defined? unit[:version] 
        unit[:editor] = ''
        unit[:holders] = ''
        unit[:longname] = ''
        unit[:category_id] = category_id
        
        Unit.create(unit)        
      end
    end
    
    generalCommon     = ActiveSupport::JSON.decode(File.read('db/data/general-common.json'))
    middleCommon      = ActiveSupport::JSON.decode(File.read('db/data/middle-common.json'))
    beginProfessional = ActiveSupport::JSON.decode(File.read('db/data/begin-professional.json'))
    middleCommon      = ActiveSupport::JSON.decode(File.read('db/data/middle-common.json'))
    addon             = ActiveSupport::JSON.decode(File.read('db/data/addon.json'))
    
    addUnits generalCommon,     child1[:id]
    addUnits middleCommon,      child2[:id]
    addUnits beginProfessional, child3[:id]
    addUnits middleCommon,      child4[:id]
    addUnits addon,             child5[:id]
end

