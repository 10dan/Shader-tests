Shader "Custom/BumpAndDiffuse"
{
	Properties{
		_myTexDiff("Diffuse Texture", 2D) = "white" {}
		_myBump("Bump Texture", 2D) = "bump" {}
		_mySlider("Bump amount", Range(0,10)) = 1
		_myBright("Brightness", Range(0,10)) = 1
		_myCube("Cube map", CUBE) = "white" {}
	}
		SubShader{

		  CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTexDiff;
			sampler2D _myBump;
			half _mySlider;
			half _myBright;
			samplerCUBE _myCube;

			struct Input {
				float2 uv_myTexDiff;
				float2 uv_myBump;
				float3 worldRefl; INTERNAL_DATA
			};

			void surf(Input IN, inout SurfaceOutput o) {

				//o.Albedo = (tex2D(_myTexDiff, IN.uv_myTexDiff) * _myBright).rgb;
				//o.Albedo = texCUBE(_myCube, IN.worldRefl).rgb;
				o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
				o.Normal *= float3(_mySlider, _mySlider, 1);
				o.Albedo = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
				//o.Emission = texCUBE(_myCube, WorldReflectionVector(IN, o.Normal)).rgb;
			}

		  ENDCG
		}
		Fallback "Diffuse"
}
