baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [ 
		
		spec package: 'JenkinsBuildTools-Core'.
		
	].
	

	spec for: #pharo do:[
		
		spec package: 'JenkinsBuildTools-Core' with:[spec includes: 'JenkinsBuildTools-Pharo'].
				
	].
	
	spec for: #gemstone do:[
		
		spec package: 'JenkinsBuildTools-Core' with:[spec includes: 'JenkinsBuildToolsGemStone'].
		
	]