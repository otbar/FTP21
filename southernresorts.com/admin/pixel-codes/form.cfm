<cfset page.icon="fa-info-circle">
<cfif isdefined('url.id')>
  <cfquery name="getinfo" dataSource="#application.dsn#">
    select * from cms_pixel_codes where id = <cfqueryparam CFSQLType="CF_SQL_INTEGER" value="#url.id#">
  </cfquery>
</cfif>

<cfset page.title ="Pixel Codes">
<cfset module = 'Pixel Codes'>
<cfinclude template="/admin/components/header.cfm">

<cfoutput>

  <cfif isdefined('url.success') and isdefined('url.id')>
    <div class="alert alert-success">
      <button class="close" data-dismiss="alert">?</button>
      <strong>Update successful!</strong> Continue editing this #module# or <a href="index.cfm">go back.</a>
    </div>
  <cfelseif isdefined('url.success')>
    <div class="alert alert-success">
      <button class="close" data-dismiss="alert">?</button>
      <strong>Success!</strong> Add another #module# or <a href="index.cfm">go back.</a>
    </div>
  </cfif>
  
  <div class="widget-box">
    <div class="widget-title">
      <span class="icon">
        <i class="icon-th"></i>
      </span>
      <h5>Add / Edit Form</h5>
    </div>
    <div class="widget-content nopadding">
  
      <form action="submit.cfm" method="post" class="form-horizontal">
	  
	  
	  
	   <div class="control-group">
					<label class="control-label">Pixel Code Type</label>
					<div class="controls">
						<input maxlength="255" name="PixelCodeType" type="text" <cfif parameterexists(id)>value="#getinfo.PixelCodeType#"</cfif>>
					</div>
				</div>
	  
        <div class="control-group">
					<label class="control-label">Pixel Codes</label>
					<div class="controls">
						
            <textarea name="pixelcode" rows="30" cols="30" id="txtContent" class="mceNoEditor"><cfif parameterexists(id)>#getinfo.pixelcode#</cfif></textarea>
                        
					</div>
				</div>
				<div class="form-actions">
					<input type="submit" value="Submit" class="btn btn-primary">
          <cfif parameterexists(id)><input type="hidden" name="id" value="#url.id#"></cfif>
				</div>
      </form>
    
    </div>
  </div>
  
</cfoutput>

<cfinclude template="/admin/components/footer.cfm">