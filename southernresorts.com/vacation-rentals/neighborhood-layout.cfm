<cfquery name="getinfo" dataSource="#settings.dsn#">
SELECT id,
       name,
       shortDescription,
       seoFriendlyURL,
       (SELECT original FROM track_nodes_images WHERE nodeID = track_nodes.id ORDER BY `order` LIMIT 1) AS mainphoto
FROM track_nodes
WHERE typeName = 'Neighborhood' 
      AND seoFriendlyURL IS NOT NULL 
      AND seoFriendlyURL <> ''
ORDER BY name
</cfquery>

<cfinclude template="/vacation-rentals/components/header.cfm">

<div class="cms-resorts-option">
  <div class="container">
    <div class="row">
      <cfoutput query="getinfo">
        <div class="col-lg-4 col-md-6 col-sm-4 col-xs-6">
          <div class="block">
            <div class="thumbnail">
               <cfif len(getinfo.mainphoto)>
                <a href="/neighborhood/#getinfo.seoFriendlyURL#"><img src="#getinfo.mainphoto#"></a>
              <cfelse>
                <a href="/neighborhood/#getinfo.seoFriendlyURL#"><img src="http://placehold.it/400x300&text=placeholder"></a>
              </cfif>
            </div>
            <p class="h3 site-color-2">#getinfo.name#</p>
            <p>#mid(getinfo.shortDescription,1,200)#...</p>
            <a href="/neighborhood/#getinfo.seoFriendlyURL#" class="btn site-color-1-bg site-color-6-bg-hover text-white text-white-hover">More Information</a>
          </div>
        </div>
      </cfoutput>
    </div>
  </div>
</div>

<cfinclude template="/vacation-rentals/components/footer.cfm">