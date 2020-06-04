Shader "Custom/Test"
{
	Properties{
		_myTexDiff("Diffuse Texture", 2D) = "white" {}
		_myTexEm("Emissive Texture", 2D) = "black" {}
	}
		SubShader{

		  CGPROGRAM
			#pragma surface surf Lambert

			sampler2D _myTexDiff;
			sampler2D _myTexEm;

			struct Input {
				float2 uv_myTexDiff;
				float2 uv_myTexEm;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_myTexDiff, IN.uv_myTexDiff).rgb;
				o.Emission = tex2D(_myTexEm, IN.uv_myTexEm).rgb;
			}

		  ENDCG
		}
		Fallback "Diffuse"
}
