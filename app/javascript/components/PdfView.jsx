import React from 'react'
import { Document, Page } from 'react-pdf/dist/entry.webpack'

export default () => {
    const pdfLink = `/assets/resume.pdf?version=${Date.now()}`
    return (
        <Document onClick={()=>{window.location = pdfLink}} file={pdfLink}>
            <Page pageNumber={1} scale={2} />
        </Document>
    )
}