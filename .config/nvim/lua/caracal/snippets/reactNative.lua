local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

-- Define snippets for JavaScript and related filetypes
ls.add_snippets("javascript", {

	--NOTE: Functional Component with State

	s("rnfce", {
		t({
			"import React from 'react';",
			"import { View, Text, StyleSheet } from 'react-native';",
			"",
			"const ",
		}),
		i(1, "ComponentName"), -- First cursor position with default value
		t({ " = () => {", "  return (" }),
		t({ "    <View style={styles.container}>", "      <Text>" }),
		rep(1), -- Mirror the component name in <Text> tag
		t({ "</Text>", "    </View>", "  );", "};", "", "export default " }),
		rep(1), -- Mirror the component name in the export statement
		t({
			";",
			"",
			"const styles = StyleSheet.create({",
			"  container: {",
			"    flex: 1,",
			"    justifyContent: 'center',",
			"    alignItems: 'center',",
			"  },",
			"});",
		}),
	}),

	--NOTE: Class Component with State

	s("rnccs", {
		t({
			"import React, { Component } from 'react';",
			"import { View, Text, StyleSheet } from 'react-native';",
			"",
			"class ",
		}),
		i(1, "ComponentName"),
		t({
			" extends Component {",
			"  constructor(props) {",
			"    super(props);",
			"    this.state = {",
			"      data: 'initialValue'",
			"    };",
			"  }",
			"",
			"  render() {",
			"    return (",
		}),
		t({ "      <View style={styles.container}>", "        <Text>" }),
		rep(1), -- Mirror the component name in <Text> tag
		t({ "</Text>", "      </View>", "    );", "  }", "}", "", "export default " }),
		rep(1), -- Mirror the component name in the export statement
		t({
			";",
			"",
			"const styles = StyleSheet.create({",
			"  container: {",
			"    flex: 1,",
			"    justifyContent: 'center',",
			"    alignItems: 'center',",
			"  },",
			"});",
		}),
	}),

	--NOTE: Function Component with Props

	s("rnfcp", {
		t({ "import React from 'react';", "import { View, Text, StyleSheet } from 'react-native';", "", "const " }),
		i(1, "ComponentName"),
		t({ " = ({ ", "propName", " }) => {", "  return (" }),
		t({
			"    <View style={styles.container}>",
			"      <Text>{",
			"propName",
			"}</Text>",
			"    </View>",
			"  );",
			"} ;",
			"",
			"export default ",
		}),
		rep(1), -- Mirror the component name in the export statement
		t({
			";",
			"",
			"const styles = StyleSheet.create({",
			"  container: {",
			"    flex: 1,",
			"    justifyContent: 'center',",
			"    alignItems: 'center',",
			"  },",
			"});",
		}),
	}),

	--NOTE: Hook Component with Cursor Placement

	s("rnhuc", {
		t({
			"import React, { useEffect, useState } from 'react';",
			"import { View, Text, StyleSheet } from 'react-native';",
			"",
			"const ",
		}),
		i(1, "ComponentName"),
		t({
			" = () => {",
			"  const [data, setData] = useState(",
			"initialValue",
			");",
			"",
			"  useEffect(() => {",
			"    // Fetch data or perform side effect here",
			"  }, []);",
			"",
			"  return (",
		}),
		t({
			"    <View style={styles.container}>",
			"      <Text>{data}</Text>",
			"    </View>",
			"  );",
			"};",
			"",
			"export default ",
		}),
		rep(1), -- Mirror the component name in the export statement
		t({
			";",
			"",
			"const styles = StyleSheet.create({",
			"  container: {",
			"    flex: 1,",
			"    justifyContent: 'center',",
			"    alignItems: 'center',",
			"  },",
			"});",
		}),
		i(2), -- Move cursor to the `useState` initial value after editing the component name
	}),

	--NOTE: Button Component

	s("rnbc", {
		t({
			"import React from 'react';",
			"import { TouchableOpacity, Text, StyleSheet } from 'react-native';",
			"",
			"const ",
		}),
		i(1, "ButtonComponentName"),
		t({ " = ({ label, onPress }) => {", "  return (" }),
		t({
			"    <TouchableOpacity onPress={onPress} style={styles.button}>",
			"      <Text style={styles.text}>{label}</Text>",
			"    </TouchableOpacity>",
			"  );",
			"} ;",
			"",
			"export default ",
		}),
		rep(1), -- Mirror the component name in the export statement
		t({
			";",
			"",
			"const styles = StyleSheet.create({",
			"  button: {",
			"    padding: 10,",
			"    backgroundColor: '#007BFF',",
			"    borderRadius: 5,",
			"  },",
			"  text: {",
			"    color: '#FFFFFF',",
			"    textAlign: 'center',",
			"  },",
			"});",
		}),
	}),
})

-- Extend snippets to other file types
ls.filetype_extend("javascriptreact", { "javascript" })
ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })
