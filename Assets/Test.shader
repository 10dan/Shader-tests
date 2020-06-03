Shader "MyShaders/firstTest"{
	Properties{
		_col("Albedo Color", Color) = (1,1,1,1)
		_emission("Emission Color", Color) = (1,1,1,1)
		_normal("Normal Color", Color) = (1,1,1,1)
	}

	SubShader{
		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float2 uvMainTex;
			};

			fixed4 _col;
			fixed4 _emission;
			fixed4 _normal;

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = _col.rgb;
				o.Emission = _emission.rgb;
				o.Normal = _normal.rgb;
			}
		ENDCG
		}
		FallBack "Diffuse"
}