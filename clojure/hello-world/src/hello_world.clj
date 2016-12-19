(ns hello-world)

(defn hello
 ([] "Hello, World!")
 ([name] (if (clojure.string/blank? name)
  "Hello, World!"
  (str "Hello, " name "!")))
)
