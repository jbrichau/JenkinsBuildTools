baseline
baseline: spec

	<baseline>
	
	spec for: #common do: [ 
		
		spec package: 'JenkinsBuildTools-Core'.
		spec package: 'JenkinsBuildTools-AddOns'  with: [
			spec requires: #('JenkinsBuildTools-Core') ].
		
	].
	

	spec for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x') do:[
		spec
			package: 'JenkinsBuildTools-Pharo';
			package: 'JenkinsBuildTools-Core' with:[spec includes: 'JenkinsBuildTools-Pharo'].
				
	].

	spec for: #(#'pharo4.x') do:[
		spec
			package: 'JenkinsBuildTools-Pharo40';
			package: 'JenkinsBuildTools-Core' with:[spec includes: 'JenkinsBuildTools-Pharo40'].
				
	].
	
	spec for: #gemstone do:[
		spec 
			package: 'JenkinsBuildToolsGemStone';
			package: 'JenkinsBuildTools-Core' with:[spec includes: 'JenkinsBuildToolsGemStone'].
		
	]