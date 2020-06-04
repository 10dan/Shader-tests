Shader "Custom/BumpAndDiffuse"
{
	Properties{
		_myTexDiff("Diffuse Texture", 2D) = "white" {}
		_myBump("Normal Texture", 2D) = "bump" {}
		_mySlider("Bump amount", Range(0,10)) = 1
		_myScale("Texture scale", Range(0.1,10)) = 1
	}
		SubShader{

		  CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTexDiff;
			sampler2D _myBump;
			half _mySlider;
			half _myScale;

			struct Input {
				float2 uv_myTexDiff;
				float2 uv_myBump;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_myTexDiff, IN.uv_myTexDiff * _myScale).rgb;
				o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _myScale));
				o.Normal *= float3(_mySlider, _mySlider, 1);
			}

		  ENDCG
		}
		Fallback "Diffuse"
}
