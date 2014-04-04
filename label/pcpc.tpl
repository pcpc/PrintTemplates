{% extends parameters.print ? "printbase" : "base" %}
{% block style %}

<!-- default -->

<link href="//pcpc.github.io/PrintTemplatesCSS/labels.css" media="all" rel="stylesheet" type="text/css" />
{% endblock %}
{% block content %}
	<div class="labels">
	{% for Label in Labels %}
		{% for copy in 1..Label.copies %}
			<div class="label size{{Label.MetaData.size}}{%if Label.MetaData.title == 'none'%} notitle{%endif%}">
				<article>
					<!-- <h1>{{ Label.MetaData.title }}</h1> -->

					<p class="description">
						<span class="authorname">{{ Label.Item.customSku  }}</span><br/>
						<span class="booktitle">{{ Label.Item.description|strreplace('_',' ') }}</span>
					</p>
					<div class="barcode">
					<img class="ean8" src="/barcode.php?type=label&amp;number={{ Label.Item.systemSku }}&amp;ean8=1&amp;noframe=1">
					<img class="ean" src="/barcode.php?type=label&amp;number={{ Label.Item.systemSku }}&amp;noframe=1">
				</div>
				</article>
				<footer class="vendor">
					{{ Label.Item.defaultVendorID }}
				</footer>
				{% if Label.MetaData.price > 0 %}
					<footer class="price">
						<p class="saleprice">
							{{ Label.MetaData.price|money|htmlparsemoney|raw }}</p>
							{% if Label.MetaData.msrp %}
							<p class="msrp">MSRP {{ Label.MetaData.msrp|money }}</p>
							{% endif %}
					</footer>
				{% endif %}
				
			</div>
		{% endfor %}
	{% endfor %}
	</div>
{% endblock content %}
