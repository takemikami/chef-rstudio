rstudio Cookbook
================

このCookbookはRstudioServerをインストールします。

Rstudioについては以下をご覧下さい。
 https://www.rstudio.com

Requirements
------------

対応するOSは、CentOSです。


Attributes
----------
#### rstudio::server
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rstudio-server']['version']</tt></td>
    <td>String</td>
    <td>RstudioServerのバージョン</td>
    <td><tt>0.97.551</tt></td>
  </tr>
</table>

Usage
-----
#### rstudio::server
RstudioServerのインストールと自動起動設定を行います。

Just include `rstudio:server` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rstudio::server]"
  ]
}
```

License and Authors
-------------------
Authors: Takeshi Mikami
