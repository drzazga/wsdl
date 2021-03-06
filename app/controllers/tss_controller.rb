class TssController < ApplicationController
  web_service_api TssApi
  web_service_dispatching_mode :direct
  wsdl_service_name 'parse'
  web_service_scaffold :invoke

  def parse(rdf)
    document = ''
    doc = REXML::Document.new(rdf)
    
    @action = doc.elements["//j.0:UserContext/j.0:hasActionName"].text
  
    html = ''

    case @action
      when /welcome/
        html = welcome(doc)
      when /login/
        html = login(doc)
      when /register-1/        
        html = register_1(doc)
      when /register_2/
        html = register_2(doc)
    end
    html.gsub("\t", "").gsub("\n", "")
  end

  def set_variable(doc)
    @session_id = doc.elements["//j.0:UserContext/j.0:hasSessionID"].text
    @media_type = doc.elements["//j.0:UserContext/j.0:hasMediaType"].text    
    @user_id = doc.elements["//j.0:UserContext/j.0:hasUserID"].text  
  end

  def login(doc)
    set_variable(doc)
    "<html><body>
		  <p>WELCOME TO TSS!</p>
		  <form action='login'  method='get'>
		    <input type='hidden' name='action-name' value ='check-login-1'/>
		    <input type='hidden' name='session-id' value ='#{@session_id}'/>
		    <input type='hidden' name='media-type' value ='#{@media_type}'/>
        <input type='hidden' name='user-id' value ='#{@user_id}'/>
		    <input type='text' name='login'/>
		    <input type='password' name='password'/>
		    <input type='submit' value='go!'/>
		  </form>
    </body></html>"
  end

  def register_1(doc)
    set_variable(doc)

    "<html><body>
		  <p>WELCOME TO TSS!</p>
		  <form action='login'  method='get'>
		      <input type='hidden' name='action-name' value ='check-register-1'/>
		      <input type='hidden' name='session-id' value ='#{@session_id}'/>
		      <input type='hidden' name='media-type' value ='#{@media_type}'/>
          <input type='hidden' name='user-id' value ='#{@user_id}'/>
          <table align='center'>  
        		<tr>                                       
			        <td align='right'>your age: </td>                    
     		      <td><input type='text' name='http://www.ibspan.waw.pl/tss/UserModelling#hasAge'/></td>
		        </tr>                                      
		        <tr>                                       
			        <td align='right'>assess your wealth: </td>          
        			<td>                                   
			          <select name='http://www.ibspan.waw.pl/tss/UserModelling#hasWealth'>
         			    <option value='http://www.ibspan.waw.pl/tss/UserModelling#NotRich'>Not rich</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#AverageRich'>Average rich</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#Rich'>Rich</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#VeryRich'>Very rich</option>
          			</select>			                   
			        </td>                                  
        		</tr>                                        
		        <tr>                                       
			        <td align='right'>the way you wear: </td>            
        			<td>                                   
			          <select name='http://www.ibspan.waw.pl/tss/UserModelling#hasDress'>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#SportyDress'>Sportly</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#NaturalDress'>Naturally</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#ElegantDress'>Elegenatly</option>
			            <option value='http://www.ibspan.waw.pl/tss/UserModelling#OtherDress'>Other way</option>
          			</select>		                       
			        </td>                                  
		        </tr>                                      
        		<tr>
			        <td align='right'>your current profession: </td>
        			<td>
			          <select name='http://www.ibspan.waw.pl/tss/UserModelling#hasProfession'>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#StudentPupil'>Student/Pupil</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#PensionerAnnuitant'>Pensioner/Annuitant</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#ScientistTeacher'>Scientist/Teacher</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#UnemployedJobSeeker'>Unemployed/Job seeker</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#Handworker'>Handworker</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#AdvertisingMarketingWorker'>Advertising/Marketing worker</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#SpecialistFreeLancer'>Specialist/FreeLancer</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#ManagerDirector'>Manager/Director</option>
            			<option value='http://www.ibspan.waw.pl/tss/UserModelling#OtherProfession'>Any other</option>
		          	</select>		
        			</td>
		        </tr>
      	  	<tr>
			      <td>&nbsp;</td>
			      <td><input type='submit' value='go!'/> <input type='reset' value='reset'/></td>
      	  	</tr>
    		  </table>
  		  </form>
    </body></html>"
  end

  def register_2
    set_variable(doc)

    "<html><body>
		  <p>WELCOME TO TSS!</p>
		  <form action='login'  method='get'>
		    <input type='hidden' name='action-name' value ='check-login-1'/>
		    <input type='hidden' name='session-id' value ='#{@session_id}'/>
		    <input type='hidden' name='media-type' value ='#{@media_type}'/>
        <input type='hidden' name='user-id' value ='#{@user_id}'/>
		    <table align='center'>
   		    <tr>
			      <td align='right'>your name: </td>
      			<td><input type='text' name='user-name'/></td>
		      </tr>
      		<tr>
			      <td align='right'>suggested login: </td>
			      <td><input type='text' name='login'/></td>
      		</tr>
		      <tr>
      			<td align='right'>suggested password: </td>
		      	<td><input type='password' name='password'/></td>
		      </tr>
		      <tr>
		      	<td>&nbsp;</td>
		      	<td><input type='submit' value='go!'/> <input type='reset' value='reset'/></td>
		      </tr>
		    </table>
		  </form>
    </body></html>"
  end

  def welcome(doc)
    set_variable(doc)

    @hasTitle = doc.elements["//owl:Thing/j.0:hasTitle"].text unless doc.elements["//owl:Thing/j.0:hasTitle"].nil?
    @hasErrorMessage = doc.elements["//owl:Thing/j.0:hasErrorMessage"].text unless doc.elements["//owl:Thing/j.0:hasErrorMessage"].nil?
    @hasText = doc.elements["//owl:Thing/j.0:hasText"].text unless doc.elements["//owl:Thing/j.0:hasText"].nil?
  
    @forms = []
    doc.elements.each("//j.0:LayoutElement") do |ele|
      @forms << [ele.elements["j.0:hasLabel"].text, ele.elements["j.0:hasActionName"].text]
    end

    doc_forms = ''
    @forms.each do |form|
      doc_forms += "<form action='#{form[1]}' method='get' name='#{form[1]}'>
		      <input type='hidden' name='action-name' value ='check-login-1'/>
		      <input type='hidden' name='session-id' value ='#{@session_id}'/>
		      <input type='hidden' name='media-type' value ='#{@media_type}'/>
          <input type='hidden' name='user-id' value ='#{@user_id}'/>
		    </form>
        [\>\><a href='javascript:document.#{form[1]}.submit();'>#{form[0]}</a>]"
    end

    "<html>
			<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'/>
				<title>Travel Support System
				</title>
				<link href='http://gen2.org/~drzazga/style.css' rel='stylesheet'/>
 			</head>
			<body>				
					<table cellspacing='20' cellpadding='5' width='790' align='center'>
						<tr>
							<td>
								<img src='http://gen2.org/~drzazga/logo.gif' width='750' height='200' border='0'/>
						
					<hr width='790' size='1' noshade='' align='center'/>
            <span class='menu'>
              #{doc_forms}
            </span>
						<hr width='790' size='1' noshade='' align='center'/>
            <span class='title'>#{@hasTitle}</span>
						<hr width='790' size='1' noshade='' align='center'/>
            <p class='error-msg'>#{@hasErrorMessage}</p>
            <p>#{@hasText}</p>
						<span class='foot'><center>(c) 2006 Maciej Gawinecki &amp; Pawel Kaczmarek
						<br/> project site: <a href='http://sourceforge.net/projects/e-travel'>sourceforge.net/projects/e-travel</a></center></span>

						<p/><table border='0' bgcolor='#9966ff' cellpadding='3' cellspacing='0' align='center'>
						<tr>
						<td>
							<table width='100%' cellpadding='2' cellspacing='0' border='0'>
								<tr align='center'>
								<td><font face='sans-serif, Arial, Helvetica' size='2'
									color='#FFFFFF'>Help build the largest open-content
									restaurant guide on the web.</font></td></tr>
								<tr bgcolor='#CCCCCC' align='center'>
								<td><font face='sans-serif, Arial, Helvetica' size='2'> Submit a <a
									href='http://chefmoz.org/cgi-bin/add.pl?where=$cat'>Restaurant</a> /
									<a href='http://chefmoz.org/cgi-bin/review.pl?ID=$id'>Review</a> /
									<a href='http://chefmoz.org/cgi-bin/link.pl?restID=$id'>Link</a> -
									<a href='http://chefmoz.org/about.html'><b>ChefMoz Project</b></a> -
									<a href='http://chefmoz.org/cgi-bin/apply.pl?where=$cat'>Become
									an Editor</a> </font>
								</td></tr>
							</table>
						</td>
						</tr>
						</table>
					</td>
						</tr>
					</table>
			</body>
		</html>"
  end
end
