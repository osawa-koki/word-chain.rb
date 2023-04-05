import React from "react";
import Layout from "../components/Layout";

export default function AboutPage() {
  return (
    <Layout>
      <div id="About">
        <h1>Hello, Ruby 👋</h1>
        <p className="mt-3">
          &quot;Ruby on Rails &amp; Next.js&quot;で最長のしりとりを求めてみよう！
        </p>
      </div>
    </Layout>
  );
};
